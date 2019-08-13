namespace App\Foundation\Decode;

interface DecoderInterface {

  public function decode(): dict<arraykey, mixed>;
}
