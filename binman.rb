class Binman < Formula
  desc "Terminal UI HTTP client for browsing and executing .http files"
  homepage "https://github.com/bgunnarsson/binman"
  url "https://github.com/bgunnarsson/binman/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "2d84812bbd75eadce02da73fc891131dd396751f17cca923a37bbd496a56e45f"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"binman"), "./cmd/binman"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/binman --version 2>&1", 1)
  end
end
