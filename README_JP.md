# 🇺🇸 [English](README.md) | 🇷🇺 [Русский](README_RU.md) | 🇨🇳 [简体中文](README_CN.md) | 🇯🇵 [日本語](README_JP.md)

# VXAceTranslator (2026 アップデート)

**RPGツクールVX Aceゲーム用の効率的な翻訳ツール。**  
Rubyで完全に書かれています。テキスト関連のすべての `.rvdata2` ファイルを読み取り可能なテキストファイルにデコンパイルし、その逆も可能です。

> **2026 アップデート:** 「スマートモード」の追加、スクリプト命名の問題修正、ツールの更新を行いました！

# 2026年の新機能
- **🚀 スマートモード (Smart Mode):** コマンドラインは不要です！ゲームフォルダに `.exe` を置いて実行するだけです。
  - `Decompiled` フォルダがない場合 -> 自動的に復号化（必要な場合）して **デコンパイル (Decompile)** します。
  - `Decompiled` フォルダがある場合 -> 変更をゲームデータに **コンパイル (Compile)** します。
- **🛡️ スクリプト名の保護:** スクリプト名に含まれる特殊文字（`◢`、`★`、スペースなど）の問題を修正しました。ファイルは安全な名前で保存されますが、コンパイル時に `Scripts_Info.txt` を使用して元の名前が完全に復元されます。
- **🔓 復号化ツールの更新:** 暗号化アーカイブ (`.rgss3a`) との互換性を高めるため、**RPGMakerDecrypter-cli v3.0.4**（以前は v2.0.0）を使用するようになりました。

---

# 使い方 (スマートモード)

推奨される使用方法です。

1. **準備:** `VXAceTranslator.exe` と `Resources` フォルダをゲームディレクトリ（`Game.exe` がある場所）にコピーします。
2. **デコンパイル:** `VXAceTranslator.exe` を実行します。
   - ゲームが解凍され、`Decompiled` フォルダが作成されます。
   - *注意:* スクリプトは `Decompiled/Scripts` 内にあります。ファイル名が簡略化されていても心配しないでください。本当の名前は `Scripts_Info.txt` に安全に保存されています。
3. **翻訳:** `Decompiled` フォルダ内の `.txt` および `.rb` ファイルを編集します。
4. **コンパイル:** もう一度 `VXAceTranslator.exe` を実行します。
   - `Decompiled` フォルダが検出され、新しい `Compiled/Data` フォルダが構築されます。
5. **完了:** `Compiled/Data` の内容をゲームの `Data` フォルダにコピーして、翻訳を適用します。

---

# ビルド方法 (開発者向け)

ソースコードを変更して独自の `.exe` をビルドしたい場合。

1. **Ruby 2.7.8 (Portable) をダウンロード:** [ダウンロードリンク](https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.7.8-1/rubyinstaller-2.7.8-1-x64.7z)
2. **解凍:** プロジェクトのルートディレクトリに解凍します（フォルダ名は `ruby` または `rubyinstaller-2.7.8-1-x64`）。
3. **実行:** **`MakeExe.bat`** をダブルクリックします。`VXAceTranslator.exe` が生成されます。

---

# スクリプト挿入の構文
番号を振り直さずに新しいスクリプトを挿入するには：
1. ファイル名: `Index+1 - ScriptName.rb`
2. 例: スクリプト10の後に挿入する場合は、`10+1 - MyNewScript.rb` という名前にします。
