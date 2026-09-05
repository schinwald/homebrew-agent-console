class AgentConsole < Formula
  desc "Frontend CLI for Agent Console"
  homepage "https://github.com/schinwald/agent-console"

  url "https://github.com/schinwald/agent-console/releases/download/v0.1.10/agent-console-darwin-universal.tar.gz"
  sha256 "47a5a7d58fbeafa37253eccb064a713f9bfd9f9db4f6db53461bc542e9605507"
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
