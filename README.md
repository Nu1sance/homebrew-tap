# Nu1sance Homebrew Tap

DailyDisk 的官方 Homebrew 安装源。适用于 Apple Silicon、macOS 15 及以上。

```bash
brew install --cask nu1sance/tap/dailydisk
```

默认安装到 `/Applications`；没有该目录写入权限时，可使用：

```bash
brew install --cask --appdir="$HOME/Applications" nu1sance/tap/dailydisk
```

请只保留一个安装位置。首次启动后，按应用提示授予完全磁盘访问权限并启用每日检查。

## 更新和卸载

已有应用需要替换或卸载时，先等待检查结束，在 **设置 → 通用 → 高级操作 → 暂停运行以手动替换应用** 中暂停，随后退出应用。

```bash
brew update
brew upgrade --cask nu1sance/tap/dailydisk
# 或重新安装
brew reinstall --cask nu1sance/tap/dailydisk
# 卸载应用，保留数据库和历史报告
brew uninstall --cask nu1sance/tap/dailydisk
```

更新后重新打开 DailyDisk，点击“恢复运行”，恢复原有每日任务设置。仍可使用应用内“检查更新…”；Brew 遇到相同或更高的实际版本时会保留该版本，不会降级，但可能重复下载。

安装中断后，退出 DailyDisk 并重试原命令；如果 Brew 收据已是当前版本，使用 reinstall。不要删除更新状态文件。请勿直接运行 Homebrew Caskroom 中的安装程序副本。

下载包来自 [DailyDisk GitHub Releases](https://github.com/Nu1sance/DailyDisk/releases)，经过 Developer ID 签名和 Apple 公证。此 Tap 不属于 Homebrew 官方 Cask 仓库。

[源码与问题反馈](https://github.com/Nu1sance/DailyDisk) · [安装协调说明](https://github.com/Nu1sance/DailyDisk/blob/feat/homebrew-install-coordination/Docs/Homebrew.md)
