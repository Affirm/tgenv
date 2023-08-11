# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class TgenvAffirmV021 < Formula
  desc "Affirm's forked version of tgenv, a Terragrunt version manager"
  homepage "https://github.com/Affirm/tgenv"
  url "https://github.com/Affirm/tgenv/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "a7af38eac630724e2a136522aa420ef926197cb48a387512edeb60165ecfdc98"
  license ""

  # Example dependency:
  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./install_tgenv"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test tgenv-affirm-v0.2.1`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
