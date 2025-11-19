# USX.nvim

# Unreal Engine シンタックス 💓 Neovim

<table>
  <tr>
   <td><div align=center><img width="100%" alt="image" src="https://raw.githubusercontent.com/taku25/USX.nvim/images/assets/images/cpp.png" /></div></td>
   <td><div align=center><img width="100%" alt="image" src="https://raw.githubusercontent.com/taku25/USX.nvim/images/assets/images/usf.png" /></div></td>
  </tr>
</table>

`USX.nvim` (Unreal Syntax) は、Unreal Engine 固有のファイルタイプ検出と、構文ハイライトの強化を提供する軽量プラグインです。

`.uproject` ファイルを `json` として正しく認識させ、Unreal Shader (`.ush`/`.usf`) や Unreal C++ のマクロ (`UCLASS`, `UPROPERTY` など) にTree-sitterによる専用のハイライトを提供します。

[English](./README.md) | [日本語](./README_ja.md)

---

## ✨ 機能 (Features)

* **自動ファイルタイプ検出**: `.uproject` ファイルの `filetype` を `json` に、`.ush`/`.usf` ファイルの `filetype` を `ushader` に自動で設定します。
* **オプトアウト可能な設定**: もし独自の設定を使いたい場合、`setup` 関数からこれらの `ftdetect`（ファイルタイプ検出）ルールを簡単に無効化（オプトアウト）できます。
* **C++ハイライトの強化**: `tree-sitter-unreal-cpp` 用のTree-sitterクエリを提供し、`UCLASS` や `UPROPERTY`, `UFUNCTION` といったUnreal Engine固有のマクロを正確にハイライトします。
* **シェーダーハイライト**: `ushader` (`tree-sitter-unreal-shader`) パーサー用のTree-sitterクエリを提供します。
* **軽量**: シンタックスクエリと `ftdetect` ロジックのみを含み、重い依存関係やAPIはありません。


## 🔧 必要要件 (Requirements)

* Neovim v0.11.3 以上

## 🚀 インストール (Installation)

お使いのプラグインマネージャーでインストールしてください。

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
-- lua/plugins/usx.lua

return {
  'taku25/USX.nvim',
}
````

## ⚙️ 設定 (Configuration)

このプラグインは、デフォルト設定のままで自動的に動作します。
しかし、もしファイルタイプ検出を無効にしたい場合（例: `.ush` ファイルを `hlsl` として扱いたい場合など）は、`opts` テーブル経由で設定を変更できます。

```lua
-- init.lua や usx.lua の opts = { ... } の中身

{
  -- ファイルタイプ検出の設定
  ftdetect = {
    -- trueに設定すると、.uproject の filetype を 'json' に自動設定します
    uproject = true,

    -- trueに設定すると、.ush/.usf の filetype を 'ushader' に自動設定します
    ushader = true,
  }
}
```

## ⚡ 使い方 (Usage)

このプラグインは自動的に動作します。

## その他

**Unreal Engine 関連プラグイン:**

* **[UEP.nvim](https://github.com/taku25/UEP.nvim)**
    * `.uproject` を解析し、ファイルナビゲーションなどを簡単に行えるようになります。
* **[UEA.nvim](https://www.google.com/url?sa=E&source=gmail&q=https://github.com/taku25/UEA.nvim)**
    * C++クラスがどのBlueprintアセットから使用されているかを検索します。
* **[UBT.nvim](https://github.com/taku25/UBT.nvim)**
    * BuildやGenerateClangDataBaseなどを、Neovim上から非同期で使えるようになります。
* **[UCM.nvim](https://github.com/taku25/UCM.nvim)**
    * Neovim上からクラスの追加や削除ができるようになります。
* **[ULG.nvim](https://github.com/taku25/ULG.nvim)**
    * UEのログやLiveCoding、stat fpsなどをNeovim上から表示できるようになります。
* **[USH.nvim](https://github.com/taku25/USH.nvim)**
    * Neovimから `ushell` と対話的に操作できるようになります。
* **[USX.nvim](https://github.com/taku25/USX.nvim)**
    * `tree-sitter-unreal-cpp` および `tree-sitter-unreal-shader` のハイライト設定用プラグインです。
* **[neo-tree-unl](https://github.com/taku25/neo-tree-unl.nvim)**
    * IDEのようなプロジェクトエクスプローラーを表示できます。
* **[tree-sitter for Unreal Engine](https://github.com/taku25/tree-sitter-unreal-cpp)**
    * UCLASSなどを含め、tree-sitterの構文木を使ってハイライトができます。
* **[tree-sitter for Unreal Engine Shader](https://github.com/taku25/tree-sitter-unreal-shader)**
    * usf, ush などの Unreal シェーダーの構文ハイライトを提供します。
  
## 📜 ライセンス (License)

MIT License

Copyright (c) 2025 taku25

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
