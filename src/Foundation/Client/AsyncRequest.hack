namespace App\Foundation\Client;

use namespace HH\Asio;
use type Facebook\Experimental\Http\Message\UriInterface;
use function curl_init;
use function curl_setopt;

final class AsyncRequest {
  
  public function __construct(
    private UriInterface $uri
  ) {}

  public async function request(): Awaitable<string> {
    $curl = curl_init();
    curl_setopt($curl, \CURLOPT_URL, $this->uri->toString());
    curl_setopt($curl, \CURLOPT_CUSTOMREQUEST, 'GET');
    curl_setopt($curl, \CURLOPT_HTTPHEADER, vec[
      'User-Agent: HHVM/Hack Request Client'
    ]);
    return await Asio\curl_exec($curl);
  }
}
