class Binman < Formula
  desc "Terminal UI HTTP client for browsing and executing .http files"
  homepage "https://github.com/bgunnarsson/binman"
  url "https://github.com/bgunnarsson/binman/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "409f2a4d4dc447b25cc5851ecd258680f2cb4744820be22cdc178b9049f192a1"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"binman"), "./cmd/binman"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/binman --version 2>&1", 1)
  end
end
