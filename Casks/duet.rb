cask "duet" do
  on_big_sur :or_older do
    version "2.4.7.1"
    sha256 "3e91729e333ab3e2984bec4c1194e7022d016d91c79cd21509bc00b42b9559bd"

    livecheck do
      url "https://updates.duetdisplay.com/latestMac"
      strategy :header_match do |headers|
        headers["location"][/duet[._-]v?(\d+(?:-\d+)+)\.zip/i, 1].tr("-", ".")
      end
    end
  end
  on_monterey :or_newer do
    version "3.5.1.0"
    sha256 "126392c1a41a15623e7f4fbbac2c7a4a3e86304ee66326b76a2bf0e6193d2348"

    livecheck do
      url "https://updates.duetdisplay.com/AppleSilicon"
      strategy :header_match do |headers|
        headers["location"][/duet[._-]v?(\d+(?:-\d+)+)\.zip/i, 1].tr("-", ".")
      end
    end
  end

  url "https://duetdownload.com/Mac/#{version.major_minor.dots_to_underscores}/duet-#{version.dots_to_hyphens}.zip",
      verified: "duetdownload.com/Mac/"
  name "Duet"
  desc "Remote desktop and second display tool"
  homepage "https://www.duetdisplay.com/"

  auto_updates true

  app "duet.app"

  uninstall quit: "com.kairos.duetMac",
            kext: "com.karios.driver.DuetDisplay"

  zap trash: [
        "~/Library/Application Support/com.kairos.duet*",
        "~/Library/Caches/com.crashlytics.data/com.kairos.duet*",
        "~/Library/Caches/com.kairos.duet*",
        "~/Library/Caches/io.fabric.sdk.mac.data/com.kairos.duet*",
        "~/Library/Caches/SentryCrash/duet",
        "~/Library/HTTPStorages/com.kairos.duet*",
        "~/Library/Preferences/com.kairos.duet*.plist",
      ],
      rmdir: [
        "~/Library/Caches/com.crashlytics.data",
        "~/Library/Caches/io.fabric.sdk.mac.data",
      ]
end
