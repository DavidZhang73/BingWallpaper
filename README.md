# BingWallpaper

Windows 每日必应壁纸

每日标准时间 0 点(北京时间 8 点)自动触发

如果没开机或没联网, 则自动延迟

最低支持 Win7、Win2008

## 使用

### 安装

```ps1
powershell [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor 3072; (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/DavidZhang73/BingWallpaper/main/install.ps1') | iex
```

### 卸载

```ps1
powershell [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor 3072; (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/DavidZhang73/BingWallpaper/main/uninstall.ps1') | iex
```

## 设置

通过环境变量改变行为

```bat
setx "环境变量名" "环境变量值"
```

手动刷新执行

```bat
schtasks /Run /TN "\DavidZhang\BingWallpaper"
```

- 保存路径
  - 环境变量名：`WallpaperPath`
  - 默认值：无（不保存）
  - 可选值：任意有写权限的路径
  - 注意：不以`.jpg`结尾时，文件名默认为`%Y-%m-%d.jpg`（年年年年-月月-日日.jpg），参见[UNIX 时间格式](https://docs.microsoft.com/zh-cn/powershell/module/microsoft.powershell.utility/get-date#notes)
- 分辨率
  - 环境变量名：`WallpaperResolution`
  - 默认值：`UHD`
  - 可选值：
    - `UHD`（原图分辨率，一般 4k 以上）
    - `1920x1200`
    - `1920x1080`
    - `1366x768`
    - `1280x768`
    - `1024x768`
    - `800x600`
    - `800x480`
    - `768x1280`
    - `720x1280`
    - `640x480`
    - `480x800`
    - `400x240`
    - `320x240`
    - `240x320`
- 国际版
  - 环境变量名：`WallpaperEnSearch`
  - 默认值：`0`（国内版）
  - 可选值：`0`, `1`
- 几天前
  - 环境变量名：`WallpaperDaysAgo`
  - 默认值：`0`（今天）
  - 可选值：`0`, `1`, `2`, `3`, `4`, `5`, `6`, `7`
