class AgentConsole < Formula
  desc "Frontend CLI for Agent Console"
  homepage "https://github.com/schinwald/agent-console"

  url "https://github.com/schinwald/agent-console/releases/download/v0.1.15/agent-console-darwin-universal.tar.gz"
  sha256 "f8f8e8d06b18fe8e6c880cec391c62d23fd949cc612773c9b9426a075ae1f5b3"
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
