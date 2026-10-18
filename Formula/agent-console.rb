class AgentConsole < Formula
  desc "Frontend CLI for Agent Console"
  homepage "https://github.com/schinwald/agent-console"

  url "https://github.com/schinwald/agent-console/releases/download/v0.1.15/agent-console-darwin-universal.tar.gz"
  sha256 "ac25b864abb0d7c8394b3110b3361af94361b8103f21bc7e20ab916dbe71804e"
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
