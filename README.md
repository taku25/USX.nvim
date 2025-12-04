# USX.nvim

# Unreal Engine Syntax 💓 Neovim

<table>
  <tr>
   <td><div align=center><img width="100%" alt="image" src="https://raw.githubusercontent.com/taku25/USX.nvim/images/assets/images/cpp.png" /></div></td>
   <td><div align=center><img width="100%" alt="image" src="https://raw.githubusercontent.com/taku25/USX.nvim/images/assets/images/usf.png" /></div></td>
  </tr>
</table>

`USX.nvim` (Unreal Syntax) is a lightweight plugin that provides filetype detection and enhanced syntax highlighting for Unreal Engine specific files.

It ensures that `.uproject` files are correctly read as `json`, and provides dedicated Tree-sitter highlighting for Unreal Shaders (`.ush`/`.usf`) and Unreal C++ macros (`UCLASS`, `UPROPERTY`, etc.).

[English](./README.md) | [日本語](./README_ja.md)

---

## ✨ Features

* **Automatic Filetype Detection**: Sets `filetype` for `.uproject` to `json` and for `.ush`/`.usf` to `ushader`.
* **Opt-Out Configuration**: Easily disable the automatic `ftdetect` rules via the `setup` function if you prefer your own settings.
* **Enhanced C++ Highlighting**: Provides Tree-sitter queries for `tree-sitter-unreal-cpp` to correctly highlight `UCLASS`, `UPROPERTY`, `UFUNCTION`, and other macros.
* **Shader Highlighting**: Provides Tree-sitter queries for the `ushader` (`tree-sitter-unreal-shader`) parser.
* **Lightweight**: Contains *only* syntax queries and `ftdetect` logic. No heavy dependencies or APIs.


## 🔧 Requirements

* Neovim v0.11.3 or later

## 🚀 Installation

Install with your favorite plugin manager.

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
-- lua/plugins/usx.lua

return {
  'taku25/USX.nvim',
  opts = {
    -- Add your settings here (details below)
  }
}
````

## ⚙️ Configuration

This plugin works out-of-the-box with default settings.
However, if you want to disable the automatic filetype detection (e.g., if you want to use `hlsl` for `.ush` files), you can do so via the `opts` table.

```lua
-- Inside init.lua or opts = { ... } for usx.lua

{
  -- Filetype detection settings
  ftdetect = {
    -- Set to true to automatically set .uproject filetype to 'json'
    uproject = true,

    -- Set to true to automatically set .ush/.usf filetype to 'ushader'
    ushader = true,
  }
}
```

## ⚡ Usage

This plugin works automatically.


## Others

**Unreal Engine Related Plugins:**

  * [**UnrealDev.nvim**](https://github.com/taku25/UnrealDev.nvim)
      * **Recommended:** An all-in-one suite to install and manage all these Unreal Engine related plugins at once.
  * [**UNX.nvim**](https://github.com/taku25/UNX.nvim)
      * **Standard:** A dedicated explorer and sidebar optimized for Unreal Engine development. It visualizes project structure, class hierarchies, and profiling insights without depending on external file tree plugins.
  * [UEP.nvim](https://github.com/taku25/UEP.nvim)
      * Analyzes .uproject to simplify file navigation.
  * [UEA.nvim](https://github.com/taku25/UEA.nvim)
      * Finds Blueprint usages of C++ classes.
  * [UBT.nvim](https://github.com/taku25/UBT.nvim)
      * Use Build, GenerateClangDataBase, etc., asynchronously from Neovim.
  * [UCM.nvim](https://github.com/taku25/UCM.nvim)
      * Add or delete classes from Neovim.
  * [ULG.nvim](https://github.com/taku25/ULG.nvim)
      * View UE logs, LiveCoding, stat fps, etc., from Neovim.
  * [USH.nvim](https://github.com/taku25/USH.nvim)
      * Interact with ushell from Neovim.
  * [USX.nvim](https://github.com/taku25/USX.nvim)
      * Plugin for highlight settings for tree-sitter-unreal-cpp and tree-sitter-unreal-shader.
  * [neo-tree-unl](https://github.com/taku25/neo-tree-unl.nvim)
      * Integration for [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) users to display an IDE-like project explorer.
  * [tree-sitter for Unreal Engine](https://github.com/taku25/tree-sitter-unreal-cpp)
      * Provides syntax highlighting using tree-sitter, including UCLASS, etc.
  * [tree-sitter for Unreal Engine Shader](https://github.com/taku25/tree-sitter-unreal-shader)
      * Provides syntax highlighting for Unreal Shaders like .usf, .ush.

## 📜 License

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
