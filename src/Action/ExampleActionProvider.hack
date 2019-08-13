namespace App\Action;

use type App\Mapper\UserMapper;
use type App\Responder\ExampleResponder;
use type Nazg\Glue\Container;
use type Nazg\Glue\ProviderInterface;

final class ExampleActionProvider
  implements ProviderInterface<ExampleAction> {

  public function get(
    Container $container
  ): ExampleAction {
    return new ExampleAction(
      $container->get(UserMapper::class),
      new ExampleResponder()
    );
  }
}
