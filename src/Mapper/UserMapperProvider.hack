namespace App\Mapper;

use type App\Storage\Profile;
use type App\Foundation\Decode\DecoderInterface;
use type Nazg\Glue\Container;
use type Nazg\Glue\ProviderInterface;

final class UserMapperProvider implements ProviderInterface<UserMapper> {

  public function get(
    \Nazg\Glue\Container $container
  ): UserMapper {
    return new UserMapper(
      $container->get(Profile::class)
    );
  }
}
