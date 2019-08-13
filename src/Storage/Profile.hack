namespace App\Storage;

use namespace HH\Lib\Vec;
use type Ytake\Hungrr\Uri;
use type App\Foundation\Client\AsyncRequest;

class Profile {

  public function __construct(
    protected vec<string> $uris
  ) {}

  public async function all(): Awaitable<vec<string>> {
    return await Vec\map_async(
      $this->uris,
      inst_meth($this, 'callAsync')
    );
  }

  public async function callAsync(
    string $uri
  ): Awaitable<string> {
    $client = new AsyncRequest(new Uri($uri));
    return await $client->request();
  }
}
