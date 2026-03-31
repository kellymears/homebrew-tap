class Tarot < Formula
  desc "Arcana — a tarot reading CLI"
  homepage "https://github.com/kellymears/arcana-cli"
  url "https://registry.npmjs.org/arcana-cli/-/arcana-cli-0.1.0.tgz"
  sha256 "ecd596771d0cb6bbb327acdab55bd7af921027ff066583d86a2ac1364afcbb3a"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/arcana-mcp"
    ln_sf libexec/"bin/arcana", bin/"tarot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tarot --version")
  end
end
