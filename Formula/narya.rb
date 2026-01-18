class Narya < Formula
  desc "CLI tool for managing firefox-ios"
  homepage "https://github.com/adudenamedruby/narya"
  version "20260118.1"

  depends_on "swiftlint"
  depends_on "node"

  base_url = "https://github.com/adudenamedruby/narya/releases/download/v#{version}"

  on_macos do
    if Hardware::CPU.arm?
      url "#{base_url}/narya-v#{version}-macos-arm64.tar.gz"
      sha256 "de170703482233cbdb0376c69c3b0636e3e5a982d345f0e9b90f09e6b1e96ae4"
    else
      url "#{base_url}/narya-v#{version}-macos-x86_64.tar.gz"
      sha256 "f211b89388faa12389abcf8595b445fc06e5425205c6d84080c4904c2d4db457"
    end
  end

  def install
    bin.install "narya"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/narya --version").strip
  end
end
