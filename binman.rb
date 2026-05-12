class Binman < Formula
  desc "Terminal UI HTTP client for browsing and executing .http files"
  homepage "https://github.com/bgunnarsson/binman"
  url "https://github.com/bgunnarsson/binman/archive/refs/tags/1.0.8.tar.gz"
  sha256 "c39e1e8acc8b9e6468d692fb173daad6429abdd15210e32eccc2ea50275d38e0"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"binman"), "./cmd/binman"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/binman --version 2>&1", 1)
  end
end
