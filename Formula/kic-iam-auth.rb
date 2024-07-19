class KicIamAuth < Formula
  desc "Kakao Cloud Kubernetes Service Authenticator CLI for IAM Authentication"
  homepage "https://github.com/hrm-corp/kic-iam-auth"
  on_macos do
     url "https://objectstorage.kr-central-2.kakaocloud.com/v1/fe631cd1b7a14c0ba2612d031a8a5619/public/docs/binaries-kic-iam-auth/Mac%20ARM_64%2064Bit/kic-iam-auth"
     sha256 "5136d1d56f31e92a8a1ee69fae2bcb1d5e16b6b8a439c32bad72219ee725c5b4"
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
    output = shell_output("#{bin}/kic-iam-auth version")
    assert_match %Q("An error occurred when creating openstack client: Missing input for argument [auth_url]"), output
  end
end
