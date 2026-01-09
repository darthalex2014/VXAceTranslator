# 🇺🇸 [English](README.md) | 🇷🇺 [Русский](README_RU.md) | 🇨🇳 [简体中文](README_CN.md) | 🇯🇵 [日本語](README_JP.md)

# VXAceTranslator (2026 Update)

**Efficient translator for RPG Maker VX Ace games.**  
Fully written in Ruby. Can decompile/compile all text-related `.rvdata2` files to readable text files and vice-versa.

> **Update 2026:** The project has been revived with "Smart Mode", fixed script naming issues, and updated tools!

# New Features (2026)
- **🚀 Smart Mode (Drag & Drop):** No command line needed! Just place the `.exe` in the game folder and run it.
  - If no `Decompiled` folder exists -> It automatically decrypts (if needed) and **Decompiles**.
  - If `Decompiled` folder exists -> It **Compiles** changes back to game Data.
- **🛡️ Script Name Preservation:** Fixed issues with special characters (like `◢`, `★`, spaces) in script names. Files are saved with safe names, but the original names are restored perfectly upon compilation using `Scripts_Info.txt`.
- **🔓 Updated Decrypter:** Now uses **RPGMakerDecrypter-cli v3.0.4** (previously v2.0.0) for better compatibility with encrypted archives (`.rgss3a`).

# Key Features
- **Automatic Decryption:** Automatically handles `Game.rgss3a` if the "Data" folder is missing.
- **Mod Friendly:** Full support for adding/removing scripts and positional insertion.
- **Safe Editing:** Infinite depth serialization for common events parameter.
- **Performance:** Fast decompiling/compiling speed.
- **Clean Output:** Highly organized structure (Text files + Ruby scripts).
- **Indexless & Indexing Modes:** Choose between freedom of editing or strict compatibility.

---

# How to Use (Smart Mode)

This is the recommended way to use the tool.

1. **Prepare:** Copy `VXAceTranslator.exe` and the `Resources` folder into the game directory (where `Game.exe` is).
2. **Decompile:** Run `VXAceTranslator.exe`.
   - It will unpack the game and create a `Decompiled` folder.
   - *Note:* Scripts will be inside `Decompiled/Scripts`. Don't worry if filenames look simplified; the real names are safely stored in `Scripts_Info.txt`.
3. **Translate:** Edit the `.txt` and `.rb` files in the `Decompiled` folder.
4. **Compile:** Run `VXAceTranslator.exe` again.
   - It detects the `Decompiled` folder and builds a new `Compiled/Data` folder.
5. **Finish:** Copy the contents of `Compiled/Data` into the game's `Data` folder to apply translation.

---

# How to Use (Command Line)

For advanced users or automation scripts.

**Decompiler:**
```cmd
VXAceTranslator.exe -d "GAME_DIR" -o "OUTPUT_DIR" [Optional]
```

**Compiler:**
```cmd
VXAceTranslator.exe -c "GAME_DIR" -i "INPUT_DIR" [Optional] -o "OUTPUT_DIR" [Optional]
```

**Optional Arguments:**
- `-t TARGET_FILENAME`: Process specific files only (e.g., `-t Map001`).
- `--force-decrypt`: Force decryption even if Data folder exists.
- `--switch-indexless`: Switch to indexing mode (for strict compatibility).

---

# How to Build (For Developers)

If you want to modify the source code and build your own `.exe`.

### 1. Requirements
Download **Ruby 2.7.8 (Portable)**. Do not use newer versions as they break marshal format compatibility with RPG Maker VX Ace.
- **Download Link:** [RubyInstaller-2.7.8-1-x64.7z](https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.7.8-1/rubyinstaller-2.7.8-1-x64.7z)

### 2. Setup
Extract the downloaded archive into the project root directory. The build script is smart and supports any of these folder names:
- `ruby` (Recommended)
- `rubyinstaller-2.7.8-1-x64`
- `rubyinstaller-2.7.8-1-x64\rubyinstaller-2.7.8-1-x64` (If you extracted it too deep)

### 3. Build
Simply run **`MakeExe.bat`**.
It will detect your Ruby installation, compile the gems, and produce `VXAceTranslator.exe`.

> **Note:** The build process uses a portable version of Ocra included in the `Modules` folder to avoid gem dependency hell.

---

# Script Insertion Syntax
To insert a new script without renumbering everything:
1. Name your file: `Index+1 - ScriptName.rb`
2. Example: To insert after script 10, name it `10+1 - MyNewScript.rb`.

# Indexless vs Indexing Mode
- **Indexless (Default):** Reconstructs events from scratch. Good for heavy editing.
- **Indexing:** Patches original events by ID. Good for compatibility if you only change text.
