namespace App\Providers;

use namespace App\Mapper;
use type Nazg\Foundation\ConsistentServiceProvider;

final class MapperProvider extends ConsistentServiceProvider {

  <<__Override>>
  public function apply(): void {
    $this->container
      ->bind(Mapper\UserMapper::class)
      ->provider(new Mapper\UserMapperProvider());
  }
}
