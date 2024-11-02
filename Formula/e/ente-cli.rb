class EnteCli < Formula
  desc "Command-line utility for exporting data from Ente"
  homepage "https://ente.io"
  url "https://github.com/ente-io/ente/archive/refs/tags/cli-v0.2.2.tar.gz"
  sha256 "d03754880fe7dfdc422b37e4864c2aa469a2b19c645346de2d2de7fa62b71de3"
  license "AGPL-3.0-only"

  depends_on "go" => :build

  def install
    cd "cli" do
      system "go", "build", "-o", "ente"
    end
    bin.install "cli/ente"
  end

  test do
    output = shell_output(bin/"ente version")
    assert_match "Version #{version}", output
  end
end
