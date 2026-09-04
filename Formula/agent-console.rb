class AgentConsole < Formula
  desc "Frontend CLI for Agent Console"
  homepage "https://github.com/OWNER/agent-console"
  version "0.1.0"
  license "MIT"

  depends_on "agent-console-backend"

  # Replace these release URLs and checksums when Agent Console publishes
  # versioned macOS artifacts.
  on_arm do
    url "https://github.com/OWNER/agent-console/releases/download/v0.1.0/agent-console-darwin-arm64.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  on_intel do
    url "https://github.com/OWNER/agent-console/releases/download/v0.1.0/agent-console-darwin-x86_64.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  def install
    bin.install "agent-console"
  end

  test do
    assert_match "agent-console", shell_output("#{bin}/agent-console --version")
  end
end
