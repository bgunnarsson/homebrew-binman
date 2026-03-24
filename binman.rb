class Binman < Formula
  desc "Terminal UI HTTP client for browsing and executing .http files"
  homepage "https://github.com/bgunnarsson/binreq"
  url "https://github.com/bgunnarsson/binreq/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"binman"), "./cmd/binreq"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/binman --version 2>&1", 1)
  end
end
