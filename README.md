# Neovim setup

## OS

WSL2(Ubuntu 22.04.02 LTS)  

## Install

```
sudo apt update && sudo apt upgrade  
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage  
chmod u+x nvim.appimage
./nvim.appimage
```
`./nvim.appimage` して怒られたら `./nvim.appimage --appimage-extract`  
`squashfs-root/Apprun` が実行ファイル  

`/usr/local/bin` 等，パス通ってるところにシンボリックリンク貼ると良い

### Remote

実行ファイルを転送してパス通すだけ  
ただし，LSP関連と一部プラグインは動かない

またはローカルから sshfs 等でマウントして，ローカルの Neovim から参照する  
その場合は .bashrc と .bash_logout でうまくやると楽
  
## Plugin Manager

- packer
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\  
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim  
```

## Fern  

- shift-d 用
```
sudo apt install trash-cli
```

## Telescope

- live_grep 用
```
sudo apt install ripgrep
```
  
## Python  

```
sudo apt install python3  
sudo apt install python3-pip  
sudo apt install python3-venv  
```
- pyright (required: npm)
- black (formatter; required: venv)
- isort (import formatter)
- flake8 (linter)

## Lua
- Stylua (formatter)
- luacheck (linter; required: luarock)
  
## LaTeX  

X は適宜変更
```
curl -OL http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz  
tar xvf install-tl-unx.tar.gz
sudo /usr/local/texlive/20XX/bin/X/tlmgr path add
```
- latexmk (config: ~/.latexmkrc; compiler: uplatex)
- qpdfview (viewer)
- TODO (linter)
- TODO (completion)
- TODO (forward search)
- TODO (inverse search)
  
## Markdown  
- marksman
- iamcco/markdown-preview.nvim  

## Fortran
```
pip3 install fortran-language-server  
```
- TODO
