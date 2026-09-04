class AgentConsole < Formula
  desc "Frontend CLI for Agent Console"
  homepage "https://github.com/OWNER/agent-console"

  # Replace this release URL and checksum when Agent Console publishes
  # a versioned universal macOS artifact.
  url "https://github.com/OWNER/agent-console/releases/download/v0.1.0/agent-console-darwin-universal.tar.gz"
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on "agent-console-backend"

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin.install "agent-console-#{arch}" => "agent-console"
  end

  test do
    assert_predicate bin/"agent-console", :executable?
  end
end
