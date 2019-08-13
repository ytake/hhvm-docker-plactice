namespace App\Action;

use type App\Mapper\UserMapper;
use type App\Responder\ExampleResponder;
use type HH\Lib\Experimental\IO\WriteHandle;
use type Facebook\Experimental\Http\Message\ResponseInterface;
use type Facebook\Experimental\Http\Message\ServerRequestInterface;
use type Nazg\Http\Server\AsyncMiddlewareInterface;
use type Nazg\Http\Server\AsyncRequestHandlerInterface;

final class ExampleAction implements AsyncMiddlewareInterface {

  public function __construct(
    private UserMapper $mapper,
    private ExampleResponder $responder
  ) {}

  public async function processAsync(
    WriteHandle $writeHandle,
    ServerRequestInterface $_,
    AsyncRequestHandlerInterface $_,
  ): Awaitable<ResponseInterface> {
    $result = await $this->mapper->all();
    return await $this->responder
      ->invokeAsync($writeHandle, $result);
  }
}
