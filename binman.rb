class Binman < Formula
  desc "Terminal UI HTTP client for browsing and executing .http files"
  homepage "https://github.com/bgunnarsson/binreq"
  url "https://github.com/bgunnarsson/binreq/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_SHA256_OF_RELEASE_TARBALL"
  license "MIT"

  bottle :unneeded

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"binman"), "./cmd/binreq"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/binman --version 2>&1", 1)
  end
end
