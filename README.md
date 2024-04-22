# Neovim setup

<h1 align="center">
  <img src="https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png">
</h1>

Official: [https://neovim.io/](https://neovim.io/)  
GitHub: [https://github.com/neovim/neovim/blob/master](https://github.com/neovim/neovim/blob/master)

## Install Neovim

Document: [https://github.com/neovim/neovim/blob/master/INSTALL.md](https://github.com/neovim/neovim/blob/master/INSTALL.md)  
Latest: [https://github.com/neovim/neovim/releases/latest/](https://github.com/neovim/neovim/releases/latest/)

Linux では最新バージョンの Neovim を確実にインストールするために，Appimage の使用を推奨

```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage  
chmod u+x nvim.appimage
./nvim.appimage
```

システムに FUSE の利用環境がない場合 `./nvim.appimage` はうまくいかないので，`--appimage-extract` オプションを付ける

```
./nvim.appimage --appimage-extract
./squashfs-root/AppRun

# Optinal: exposing nvim globally.
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim
```

## Install plugin manager

- Neovim 内のプラグインを管理するもの
- Lua で実装されている下記のものがおすすめ

### packer.nvim

Github: [https://github.com/wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)

- かつてのデファクトスタンダード
- 現在使用しているが開発終了のため lazy に移行予定

Unix, Linux:

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim  
```

Note: 本構成では packer.nvim 自身を遅延読み込みするので，`~/.local/share/nvim/site/pack/packer/start/packer.nvim` ではなく `~/.local/share/nvim/site/pack/packer/opt/packer.nvim` に置いた

### lazy.nvim

GitHub: [https://github.com/folke/lazy.nvim](https://github.com/folke/lazy.nvim)

- packer から移行予定

## Configuration

Neovim の設定は `~/.config/nvim/` 以下に置く  
本リポジトリでは以下のディレクトリ構成を採用している

```
nvim/
|- init.lua                     # マスター設定
|- lua/
   |- autocmd.lua               # 自動コマンドに関する設定
   |- keymaps.lua               # キーマップに関する設定
   |- options.lua               # Vim のオプションに関する設定
   |- packer_plugins.lua        # packer.nvim 自身とプラグイン読込に関する設定
   |- config/
      |- {plugin 名}_conf.lua   # 各プラグイン固有の設定
```
### init.lua

`require("autocmd")` のように書くことで `lua/autocmd.lua` を読みに行く

### autocmd.lua

自動コマンドについては[こちら](https://vim-jp.org/vimdoc-ja/autocmd.html)  
vimscript ではなく lua で書く必要があるので注意  
こんな感じ: `vim.cmd("autocmd {event} {aupat} {cmd}")`

### keymaps.lua

`vim.keymap.set` か `vim.api.nvim_set_keymap` でキーマップを設定できるが，リマップ防止が保証されている `vim.keymap.set` を採用する  
`vim.keymap.set("i", "jj", "<esc>", {silent = true })` とすると，insert mode で `jj` と入力すると Esc キーを入力したものと扱われる  
また `vim.g.mapleader` を設定すると `<Leader>` を起点としたショートカットを設定できる  
キーの置き換えだけでなく，キーをトリガーとしたコマンドの実行やプラグインの機能呼び出しも可能

### options.lua

オプションについては[こちら](https://vim-jp.org/vimdoc-ja/options.html)  
`expandtab`, `shiftwidth`, `softtabstop`, `tabstop` の設定は複雑なのでドキュメントをよく確認すること

### packer_plugins.lua

例:

```
vim.cmd("packadd packer.nvim")

require("packer").startup({
  function()
    -- Itself
    use({ "wbthomason/packer.nvim", opt = true })

    -- Colorscheme
    use({
      "marko-cerovac/material.nvim",
      config = function()
        require("config.material_conf")
      end,
    })
  end,

  -- Packer config
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
```

`use` 文でプラグインを読み込む  
`opt = true` とすると遅延読み込みになり，そのプラグインのコマンドを実行するまで読み込みが行われないため Neovim の起動が速くなる

また `use` 文の中の記述 `config = function() require ("config.*")` により，プラグイン読み込み後に `config/*` 内の処理を行いプラグイン固有の設定を適用できる

Neovim 起動後 `:PackerInstall` を行う  
今後は packer_plugins.lua の内容を書き換えるたびに `:PackerSync` を行う

## プラグインの説明・固有設定

### カラースキーム

- [material.nvim](https://github.com/marko-cerovac/material.nvim)  
config: `config/material_conf.lua`

### スタート画面

- [vim-startify](https://github.com/mhinz/vim-startify)

### ファイルエクスプローラ  

- [fern.vim](https://github.com/lambdalisue/fern.vim)  
  config: `config/fern_conf.lua`  
  keymaps:
  - `<Leader>e`: 起動 (オプションは `keymaps.lua` 参照)
- [fern-git-status.vim](https://github.com/lambdalisue/fern-git-status.vim)  
  fern 表示に Git 情報を付加

### ファジーファインダー

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)  
  keymaps:
  - `<Leader>ff`: ファイル名検索
  - `<Leader>fg`: ファイル内容検索 (ripgrep が必要)
  - `<Leader>fb`: バッファ検索
  - `<Leader>fh`: ヘルプ辺作
  - `<Leader>fn`: 通知検索
  - `<Leader>fo`: 最近開いたファイル検索

### スクロールバー

- [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar)  
  nvim-hlslens, gitsigns との連携が可能  
  config: `config/scrollbar_conf.lua`  

### ステータスバー

- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)  
  config: `config/lualine_conf.lua`

### タブバー

- [vim-wintabs](https://github.com/zefei/vim-wintabs)  
- [vim-wintabs-powerline](https://github.com/zefei/vim-wintabs-powerline)  
  keymaps:
  - `<Leader>th`: 左のタブに移動
  - `<Leader>tl`: 右のタブに移動
  - `<Leader>tc`: 現在のタブを閉じる
  - `<Leader>tu`: 閉じたタブを戻す
  - `<Leader>to`: 現在のタブ以外のタブを閉じる
  - `<C-w>c`: 現在のウィンドウを閉じる
  - `<C-w>o`: 現在のウィンドウ以外のウィンドウを閉じる

### ウィンドウのリサイズ

- [winresizer](https://github.com/simeji/winresizer)  
  keymaps:
  - `<C-e>`: 起動 (デフォルト設定)

### ターミナルモード

- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)  
  lazygit との連携が可能  
  config: `config/toggleterm_conf.lua`  
  keymaps:
  - `<Leader>tt`: toggleterm 起動
  - `<Leader>lg`: lazygit 起動

### コマンドライン・通知の外観

- [noice.nvim](https://github.com/folke/noice.nvim)  
  config: `config/noice_conf.lua`

### ハイライト

- [machakann/vim-highlightedyank](https://github.com/machakann/vim-highlightedyank)  
  ヤンクハイライト

- [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)  
  サーチハイライト

- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)  
  インデントハイライト  
  config: `config/indent-blankline_conf.lua`

### Language Server Protocol (LSP) 関連

[coc.nvim](https://github.com/neoclide/coc.nvim) を用いる方法もあるが，本構成では mason-lspconfig.nvim を採用して builtin LSP を使用

- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)  
  mason と lspconfig を結びつけ，さらに cmp-nvim-lsp に補完ソースを提供する  
  config: `config/mason-lspconfig_conf.lua`  
  ```
  require("mason".setup()
  require("mason-lspconfig").setup_handlers({
    function(server_name) --default handler (optional)
      require("lspconfig")[server_name].setup({
        -- to connect cmp_nvim_lsp to LSP
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
    end,
  })
  ```
  keymaps:
  - `K`: 定義・型等の情報をホバー表示
  - `gd`: 変数・関数の定義へジャンプ
  - `gn`: 変数・関数の名称一括変更 (コード群全体に適用)
  - `gr`: 変数・関数の参照リストを取得・ジャンプ
  - `gf`: コードフォーマット (none-ls の設定が必要)
  - `ge`: LSP, リンタによる診断 (warning, error 等) の表示切替
  - `g[`: 前の診断へジャンプ
  - `g]`: 次の診断へジャンプ
  - `gl`: 診断のリストを取得・ジャンプ
- [mason.nvim](https://github.com/williamboman/mason.nvim)  
  言語サーバやリンタ等のマネージャ
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)  
  LSP 設定集
- [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)  
  LSP に対応していないリンタやフォーマッタを LSP として動かすもの  
  アーカイブされた [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) の完全互換  
  config: `config/none-ls_conf.lua`

### 補完・スニペット

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)  
  補完エンジン  
  config でソース・スニペットを設定する  
  config: `config/nvim-cmp_conf.lua`  
  keymaps: 
    - `<C-b>`: ドキュメントウィンドウのバックスクロール
    - `<C-f>`: ドキュメントウィンドウのフォワードスクロール
    - `<C-p>`: 前の補完候補へカーソル移動
    - `<C-n>`: 次の補完候補へカーソル移動
    - `<C-y>`: 補完候補の表示
    - `<C-e>`: 補完中断
    - `<CR>`: 補完決定
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)  
  LSP 用ソース  
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)  
  バッファ用ソース  
- [cmp-path](https://github.com/hrsh7th/cmp-path)  
  パス用ソース  
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)  
  コマンドライン用ソース  
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)  
  スニペット用ソース  
  config でスニペット自作可能    
  config: `config/luasnip_conf.lua`  
  keymaps:
  - `<C-k>`: スニペット内入力ジャンプ

### Git

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)  
  ウィンドウ左に Git の情報を表示する  
  config: `config/gitsigns_conf.lua`  
  keymaps:
  - `[c`: 前の変更行へ移動
  - `]c`: 次の変更行へ移動
  - `<Leader>hd`: 差分ファイルの表示
  - `<Leader>td`: 削除行のトグル表示

## 言語ごとの LSP 詳細設定

### Fortran

- fortls  
  言語サーバ  
  システムに pip3 等でインストール  
  Neovim に mason でインストール  
  ルートディレクトリに `.fortls` を置き，中身がないと怒られるので `{}` と書く

- fprettify  
  フォーマッタ  
  システムに pip 等でインストール  
  `config/none-ls_conf.lua`  に以下を書く  
  `extra_args` で実行時のオプションを与える  
  ```
  local null_ls = require("null-ls")
  null_ls.setup({
    sources = {
      -- Fortran
      null_ls.builtins.formatting.fprettify.with({
        extra_args = { "--indent", "2", "--enable-replacement", "--strip-comments", "--whitespace", "2" },
      }),
    },
  })
  ```
  `.fprettify.rc` でのオプション指定は未設定

### Julia

- TODO

### LaTeX

- [vimtex](https://github.com/lervag/vimtex)  
  多機能なプラグイン  
  本構成ではコンパイルと SyncTeX による forward search を担当  
  `<LocalLeader>ll` で latexmk によるコンパイル，`<LocalLeader>lv` で forward search  
  viewer として okular を指定しているが環境に合わせる  
  inverse search は未設定  
  config: `config/vimtex_conf.lua`  

- texlab  
  言語サーバ  
  オムニ補完を担当し，nvim-lsp と luasnip 経由で Neovim に提供する  
- latexindent  
  フォーマッタ  
  Neovim に mason でインストール  
  `config/none-ls_conf.lua` に以下を書く  
  ```
  local null_ls = require("null-ls")
  null_ls.setup({
    sources = {
      -- LaTeX
      null_ls.builtins.formatting.latexindent,
    },
  })
  ```
  フォーマットオプションは未設定

### Lua

- lua-language-server  
  言語サーバ  
  Neovim に mason でインストール  
  デフォルトだと `vim` および `use` を未定義扱いするので `config/mason-lspconfig_conf.lua` に以下を書く  
  ```
  require("mason-lspconfig").setup_handlers({
    lua_ls = function()
      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "use" },
            },
          },
        },
      })
    end,
  })
  ```

- stylua  
  フォーマッタ

- luacheck  
  リンタ  
  `config/none-ls_conf.lua` に以下を書く  
  ```
  local null_ls = require("null-ls")
  null_ls.setup({
    sources = {
      -- Lua
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.diagnostics.luacheck.with({
        extra_args = { "--globals", "vim", "--globals", "use" },
      }),
    },
  })
  ```

### Markdown

- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)  
  `:MarkdownPreview` でリアルタイムプレビューを表示する  
  config: `config/markdown-preview_conf.lua`  
  インストールするには `node.js` と `yarn` が必要  
  本プラグインに関しては packer ではなく手動でのインストールがうまく動作した（詳細は GitHub リンク参照）  

### Python

- pyright  
  型チェック  
  Neovim に mason でインストール  
  インストールには `npm` が必要    

- black  
  コードフォーマッタ  

- isort   
  import フォーマッタ  

- flake8  
  リンタ  
  `config/none-ls_conf.lua` に以下を書く  
  ```
  local null_ls = require("null-ls")
  null_ls.setup({
    sources = {
      -- Python
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.diagnostics.flake8,
    },
  })
  ```
