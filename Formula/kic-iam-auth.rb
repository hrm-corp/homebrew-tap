class KicIamAuth < Formula
  desc "Kakao Cloud Kubernetes Service Authenticator CLI for IAM Authentication"
  homepage "https://github.com/hrm-corp/kic-iam-auth"
  on_macos do
    if Hardware::CPU.arm?
      url "https://objectstorage.kr-central-2.kakaocloud.com/v1/c11fcba415bd4314b595db954e4d4422/public/docs/binaries-kic-iam-auth/Mac%20ARM_64%2064Bit/kic-iam-auth"
      sha256 "4cdaad7e73681a6a0dc447dc4cf7b5f5ba791f10a63473b38f11959ca72debf8"
    end
    if Hardware::CPU.intel?
      url "https://objectstorage.kr-central-2.kakaocloud.com/v1/c11fcba415bd4314b595db954e4d4422/public/docs/binaries-kic-iam-auth/Mac%20x86_64%2064Bit/kic-iam-auth"
      sha256 "5136d1d56f31e92a8a1ee69fae2bcb1d5e16b6b8a439c32bad72219ee725c5b4"
    end
  end

  version "0.1.2"
  license "Apache-2.0"
  head "https://github.com/hrm-corp/kic-iam-auth.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "kic-iam-auth"
    prefix.install_metafiles
  end

  test do
    # The binary initializes authentication even for `version`; without an
    # auth URL it must fail locally, without contacting the cloud or using keys.
    ENV.delete("OS_AUTH_URL")
    output = shell_output("#{bin}/kic-iam-auth version 2>&1", 1)
    assert_match "Missing input for argument [auth_url]", output
  end
end
