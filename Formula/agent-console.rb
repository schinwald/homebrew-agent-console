class AgentConsole < Formula
  desc "Frontend CLI for Agent Console"
  homepage "https://github.com/schinwald/agent-console"

  url "https://github.com/schinwald/agent-console/releases/download/v0.1.0/agent-console-darwin-universal.tar.gz"
  sha256 "46346120ad8e55794ccf12ce3b2a20acbe6f58caf82359ce979fc1b75429c84b"
  license "MIT"

  depends_on "agent-console-backend"
  depends_on :macos

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin.install "bin/agent-console-darwin-#{arch}" => "agent-console"
  end

  test do
    assert_predicate bin/"agent-console", :executable?
  end
end
