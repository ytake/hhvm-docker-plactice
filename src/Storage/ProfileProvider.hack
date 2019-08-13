namespace App\Storage;

use namespace App\Config;
use namespace HH\Lib\Vec;
use type Nazg\Glue\Container;
use type Nazg\Glue\ProviderInterface;
use type Nazg\Foundation\ApplicationConfig;
use type App\Foundation\Client\AsyncRequest;
use type App\Foundation\Decode\DecoderInterface;

final class ProfileProvider implements ProviderInterface<Profile> {

  public function get(
    \Nazg\Glue\Container $container
  ): Profile {
    $c = $container->get(ApplicationConfig::class);
    if($c is Config\ApplicationConfig) {
      $app = $c->getApp();
      $uris = $app['api'];
      if ($uris is vec<_>) {
        return new Profile(
          Vec\map($uris, ($v) ==> (string)$v)
        );
      }
    }
    throw new \RuntimeException();
  }
}
