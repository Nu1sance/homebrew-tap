# frozen_string_literal: true

cask "dailydisk" do
  version "0.2.5,20"
  sha256 "cd079c8c79a469def653b7601ca5e10a4fd4349d2149abae33d1635837d79fa0"

  url "https://github.com/Nu1sance/DailyDisk/releases/download/v#{version.csv.first}/DailyDisk-#{version.csv.first}-#{version.csv.second}-arm64.zip"
  name "DailyDisk"
  desc "Disk-growth monitor with daily reports"
  homepage "https://github.com/Nu1sance/DailyDisk"

  livecheck do
    url "https://nu1sance.github.io/DailyDisk/appcast.xml"
    strategy :sparkle
  end

  # Receipt-based upgrades are intentional. The signed installer checks the
  # actual app build and preserves newer Sparkle installations without downgrade.
  depends_on arch: :arm64
  depends_on macos: :sequoia

  # No app artifact: only the signed process may replace/remove the application,
  # while holding DailyDisk's installation and scan-admission leases.
  installer script: {
    executable: "DailyDisk.app/Contents/MacOS/DailyDisk",
    args:       ["--homebrew-install", appdir.to_s],
    sudo:       false,
  }

  uninstall script: {
    executable:   "#{staged_path}/DailyDisk.app/Contents/MacOS/DailyDisk",
    args:         ["--homebrew-uninstall", appdir.to_s],
    sudo:         false,
    must_succeed: true,
  }

  caveats <<~EOS
    Before replacing or removing an existing app, pause for manual replacement
    in DailyDisk Settings > General > Advanced, then quit DailyDisk.
    After replacement, open DailyDisk and choose Resume to restore daily checks.
    First installation needs no preparation. Uninstall keeps your local history.
    Use --appdir="$HOME/Applications" if /Applications is not writable.
  EOS
end
