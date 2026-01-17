class Narya < Formula
  desc "CLI tool for managing firefox-ios"
  homepage "https://github.com/adudenamedruby/narya"
  version "20260116.4"

  depends_on "swiftlint"

  base_url = "https://github.com/adudenamedruby/narya/releases/download/v#{version}"

  on_macos do
    if Hardware::CPU.arm?
      url "#{base_url}/narya-v#{version}-macos-arm64.tar.gz"
      sha256 "e28ba3c893d97af33f6c4088de80d4d339416e7723b6f21ec7a93e5c1f2fa360"
    else
      url "#{base_url}/narya-v#{version}-macos-x86_64.tar.gz"
      sha256 "a8514c0d4937e040d170442c35e67df4f5c5c11a08a0498f7affc301ca58b2c9"
    end
  end

  def install
    bin.install "narya"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/narya --version").strip
  end
end
