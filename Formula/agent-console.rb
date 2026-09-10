class AgentConsole < Formula
  desc "Frontend CLI for Agent Console"
  homepage "https://github.com/schinwald/agent-console"

  url "https://github.com/schinwald/agent-console/releases/download/v0.1.13/agent-console-darwin-universal.tar.gz"
  sha256 "004f614918de8e77d7194525ba85bd11a6ccd4e66202cc6d17d7b5b3e7b3b3cf"
  license "MIT"

  depends_on "agent-console-backend"
  depends_on :macos

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin.install "agent-console-darwin-#{arch}" => "agent-console"
  end

  test do
    assert_predicate bin/"agent-console", :executable?
  end
end
