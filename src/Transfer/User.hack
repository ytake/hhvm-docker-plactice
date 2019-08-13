namespace App\Transfer;

final class User {

  public function __construct(
    private string $name,
    private string $blog,
    private string $link,
  ) {}

  public function getName(): string {
    return $this->name;
  }

  public function getBlog(): string {
    return $this->blog;
  }

  public function getLink(): string {
    return $this->link;
  }

  public function toShape(): shape('name' => string, 'blog' => string, 'link' => string) {
    return shape(
      'name' => $this->name,
      'blog' => $this->blog,
      'link' => $this->link,
    );
  }
}
