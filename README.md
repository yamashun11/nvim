# Neovim setup

## OS

- Windows (WSL2: Ubuntu 22.04 LTS)  
- Ubuntu 22.04 LTS  

## Install

```
sudo apt update && sudo apt upgrade  
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage  
chmod u+x nvim.appimage
./nvim.appimage
```
`./nvim.appimage` で怒られるときは `./nvim.appimage --appimage-extract` を実行する    
その場合，neovim の実行ファイルは `squashfs-root/Apprun` になる  

## Share Clipboard

init.lua から読めるところ（本リポジトリでは options.lua）に以下を追記する
```
vim.cmd("set clipboard+=unnamedplus")
```

**Windows**:

Windows 側に win32yank.exe をインストールする  
scoop でインストールする場合，Powershell で以下を実行する:   
```
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
iwr -useb get.scoop.sh | iex

scoop install win32yank
```

win32yank.exe が都度呼び出されるので多少重くなる  

**Ubuntu**:

xsel をインストールする
```
sudo apt install xsel
```

## Plugin Manager

- packer
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim  
```

## Fern  

shift-d での削除には trash-cli が必要
```
sudo apt install trash-cli
```

Nerd Font 対応のフォントを使用することで，ディレクトリ・ファイルにアイコンが付く

## Telescope

- live_grep 機能の使用には ripgrep が必要
```
sudo apt install ripgrep
```
  
## Python  

```
sudo apt install python3  
sudo apt install python3-pip  
sudo apt install python3-venv  
```
- pyright (static type checker; required: npm)
- black (formatter; required: venv)
- isort (import formatter)
- flake8 (linter)

## Lua

- lua-language-server (language server)
- Stylua (formatter)
- luacheck (linter; required: sudo apt install luarocks)

lua_ls と luacheck が "vim" と "use" に warning を出すので global 設定すること

## LaTeX  

20XX は適宜変更する
```
curl -OL http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz  
tar xvf install-tl-unx.tar.gz
sudo /usr/local/texlive/20XX/bin/X/tlmgr path add
```
- latexmk (config: ~/.latexmkrc; compiler: uplatex)
- qpdfview (viewer)
- texlab (language server)
- chktex (linter)
- latexindent (formatter)
  
## Markdown  
- marksman
- iamcco/markdown-preview.nvim  

markdown-preview.nvim は一部プラグインを手動インストールする  
`node.js` と `yarn` がインストールされていること
```
cd ~/.local/share/nvim/site/pack/packer/start/
git clone https://github.com/iamcco/markdown-preview.nvim.git
cd markdown-preview.nvim
yarn install
yarn build
```

## Fortran
```
pip3 install fortran-language-server  
```
- TODO

## Git

toggleterm.nvim + lazygit  
install lazygit:
```
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```
