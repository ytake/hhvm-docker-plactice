namespace App\Responder;

use namespace HH\Lib\Vec;
use type App\Transfer\User;
use type App\Http\HalResponse;
use type HH\Lib\Experimental\IO\WriteHandle;
use type Ytake\Hhypermedia\Serializer\HalJsonSerializer;
use type Ytake\Hhypermedia\Visitor\JsonSerializationVisitor;
use type Ytake\Hhypermedia\Link;
use type Ytake\Hhypermedia\LinkResource;
use type Ytake\Hhypermedia\Serializer;
use type Ytake\Hhypermedia\HalResource;
use type Ytake\Hhypermedia\ResourceObject;
use type Facebook\Experimental\Http\Message\ResponseInterface;

final class ExampleResponder {

  public async function invokeAsync(
    WriteHandle $writeHandle,
    vec<User> $users,
  ): Awaitable<ResponseInterface> {
    $vec = vec[];
    foreach ($users as $v) {
      $s = $v->toShape();
      $bs = new ResourceObject()
      |> $$->withLink(new Link('self', vec[
        new LinkResource(Shapes::at($s, 'blog'))
      ]));
      $er = new ResourceObject()
      |> $$->withLink(new Link('self', vec[
        new LinkResource(Shapes::at($s, 'link'))
      ]))->withEmbedded('blogs', vec[
          new HalResource($bs)
      ]);
      $vec[] = new HalResource($er, dict[
       'name' => Shapes::at($s, 'name'),
      ]);
    }
    $ro = new ResourceObject()
    |> $$->withLink(
      new Link('self', vec[
        new LinkResource('https://github.com/ytake/hhvm-docker-plactice')
      ]
    ))->withEmbedded('users', $vec);
    $serializer = new Serializer(
      new HalJsonSerializer(),
      new HalResource($ro),
      new JsonSerializationVisitor(\JSON_UNESCAPED_SLASHES)
    );
    await $writeHandle->writeAsync($serializer->serialize());
    await $writeHandle->closeAsync();
    return new HalResponse($writeHandle);
  }
}
