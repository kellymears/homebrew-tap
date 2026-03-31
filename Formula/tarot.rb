class Tarot < Formula
  desc "Arcana — a tarot reading CLI"
  homepage "https://github.com/kellymears/arcana-cli"
  url "https://registry.npmjs.org/arcana-cli/-/arcana-cli-0.2.0.tgz"
  sha256 "db9772d3dae1989a282bd96b46d1eeec44a601d9ab63fcfc8a0109b34eee5389"
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
