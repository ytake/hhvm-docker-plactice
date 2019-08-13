namespace App\Foundation\Decode;

use function json_decode;
use const JSON_FB_HACK_ARRAYS;

final class JsonDecoder implements DecoderInterface {
  
  public function __construct(
    private string $text 
  ) {}

  public function decode(): dict<arraykey, mixed> {
    return json_decode($this->text, true, 512, JSON_FB_HACK_ARRAYS);
  }
}
