namespace App\Config;

final class ApplicationConfig extends \Nazg\Foundation\ApplicationConfig {
  
  private dict<arraykey, mixed> $app = dict[];

  public function setApp(
    dict<arraykey, mixed> $app
  ): void {
    $this->app = $app;
  }

  public function getApp(): dict<arraykey, mixed> {
    return $this->app;
  }
}
