class Binman < Formula
  desc "Terminal UI HTTP client for browsing and executing .http files"
  homepage "https://github.com/bgunnarsson/binman"
  url "https://github.com/bgunnarsson/binman/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "7dc1fa5332f913e3fb2af78296641a0e0aff1c71345692f8b237799b3bfd9f32"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"binman"), "./cmd/binman"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/binman --version 2>&1", 1)
  end
end
