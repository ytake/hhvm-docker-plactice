namespace App\Mapper;

use namespace HH\Lib\Vec;
use type App\Transfer\User;
use type App\Storage\Profile;
use type App\Foundation\Decode\JsonDecoder;
use function array_key_exists;

final class UserMapper {

  public function __construct(
    private Profile $profile
  ) {}

  public async function all(): Awaitable<vec<User>> {
    $result = await $this->profile->all();
    return Vec\map($result, $v ==> {
      $decode = (new JsonDecoder($v))->decode();
      return new User(
        array_key_exists('name', $decode) ? (string) $decode['name'] : 'none',
        array_key_exists('blog', $decode) ? (string) $decode['blog'] : 'blog',
        array_key_exists('blog', $decode) ? (string) $decode['html_url'] : 'html_url');
    });
  }
}
