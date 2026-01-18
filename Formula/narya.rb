class Narya < Formula
  desc "CLI tool for managing firefox-ios"
  homepage "https://github.com/adudenamedruby/narya"
  version "20260118.0"

  depends_on "swiftlint"

  base_url = "https://github.com/adudenamedruby/narya/releases/download/v#{version}"

  on_macos do
    if Hardware::CPU.arm?
      url "#{base_url}/narya-v#{version}-macos-arm64.tar.gz"
      sha256 "b17363c8842826470d9d2ea3283aaa75fd20fb26f22c870423bfd8c82f7eb170"
    else
      url "#{base_url}/narya-v#{version}-macos-x86_64.tar.gz"
      sha256 "e13c1da282e42b5abdf55ddbbf33d08e608ecd4498421c397c8a7195b1d101b1"
    end
  end

  def install
    bin.install "narya"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/narya --version").strip
  end
end
