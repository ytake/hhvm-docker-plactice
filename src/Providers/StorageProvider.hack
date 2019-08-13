namespace App\Providers;

use namespace App\Storage;
use type Nazg\Foundation\ConsistentServiceProvider;

final class StorageProvider extends ConsistentServiceProvider {

  <<__Override>>
  public function apply(): void {
    $this->container
      ->bind(Storage\Profile::class)
      ->provider(new Storage\ProfileProvider());
  }
}
