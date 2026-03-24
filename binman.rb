class Binman < Formula
  desc "Terminal UI HTTP client for browsing and executing .http files"
  homepage "https://github.com/bgunnarsson/binman"
  url "https://github.com/bgunnarsson/binman/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "194748b1287d58b13e2064b4f7ac966b70937b96860d1649fdf015d8990c2f5d"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"binman"), "./cmd/binman"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/binman --version 2>&1", 1)
  end
end
