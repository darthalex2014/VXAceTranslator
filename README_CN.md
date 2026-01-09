# 🇺🇸 [English](README.md) | 🇷🇺 [Русский](README_RU.md) | 🇨🇳 [简体中文](README_CN.md) | 🇯🇵 [日本語](README_JP.md)

# VXAceTranslator (2026 更新)

**适用于 RPG Maker VX Ace 游戏的高效翻译工具。**  
完全使用 Ruby 编写。可以将所有与文本相关的 `.rvdata2` 文件反编译为可读文本文件，反之亦然。

> **2026 更新：** 项目已重启！增加了“智能模式”，修复了脚本命名问题，并更新了工具！

# 2026 新功能
- **🚀 智能模式 (Smart Mode)：** 无需命令行！只需将 `.exe` 放入游戏文件夹并运行。
  - 如果不存在 `Decompiled` 文件夹 -> 自动解密并 **反编译 (Decompile)**。
  - 如果存在 `Decompiled` 文件夹 -> 将更改 **编译 (Compile)** 回游戏数据。
- **🛡️ 脚本名称保护：** 修复了脚本名称中特殊字符（如 `◢`、`★`、空格）的问题。文件以安全名称保存，但在编译时使用 `Scripts_Info.txt` 完美恢复原始名称。
- **🔓 更新的解密器：** 现在使用 **RPGMakerDecrypter-cli v3.0.4**（之前是 v2.0.0），以更好地兼容加密档案 (`.rgss3a`)。

---

# 如何使用 (智能模式)

推荐的使用方法。

1. **准备：** 将 `VXAceTranslator.exe` 和 `Resources` 文件夹复制到游戏目录（`Game.exe` 所在位置）。
2. **反编译：** 运行 `VXAceTranslator.exe`。
   - 它将解包游戏并创建 `Decompiled` 文件夹。
   - *注意：* 脚本位于 `Decompiled/Scripts` 中。如果文件名看起来简化了，不用担心；真实名称安全地存储在 `Scripts_Info.txt` 中。
3. **翻译：** 编辑 `Decompiled` 文件夹中的 `.txt` 和 `.rb` 文件。
4. **编译：** 再次运行 `VXAceTranslator.exe`。
   - 它检测到 `Decompiled` 文件夹并构建新的 `Compiled/Data` 文件夹。
5. **完成：** 将 `Compiled/Data` 的内容复制到游戏的 `Data` 文件夹中以应用翻译。

---

# 如何构建 (开发者)

如果您想修改源代码并构建自己的 `.exe`。

1. **下载 Ruby 2.7.8 (Portable)：** [下载链接](https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.7.8-1/rubyinstaller-2.7.8-1-x64.7z)
2. **解压：** 将其解压到项目根目录（文件夹名为 `ruby` 或 `rubyinstaller-2.7.8-1-x64`）。
3. **运行：** 双击 **`MakeExe.bat`**。它将生成 `VXAceTranslator.exe`。

---

# 脚本插入语法
要在不重新编号的情况下插入新脚本：
1. 文件命名：`Index+1 - ScriptName.rb`
2. 示例：要在脚本 10 之后插入，请将其命名为 `10+1 - MyNewScript.rb`。
