# Description:

Neovim config for versions >= 0.12
Uses vim.pack as package manager instead of lazy.


# Installation

1) Install neovim

```sh
sudo dnf install nvim
```

2) Clone repository into ~/.config/nvim

```sh
git clone git@github.com:MajortomVR/neovim-config.git ~/.config/nvim
```


# Dependencies:

## Nerdfont

Download a nerd font from https://www.nerdfonts.com for example.
(RobotoMono Nerd Font), download the zip package.

unzip into `~/.local/share/fonts/RobotoMono/`

in the terminal execute afterwards:
```bash
fc-cache -fv
```


## For Plugins:
- ripgrep 
    - Used for fzf-lua
    - install using `sudo apt install ripgrep`
- xclip
    - for copy pasting using the clipboard (`unnamedplus`)


## LSP:
- lua
    - `lua-language-server`
- c++
    - `clangd`
- javascript
    - `vtsls`
- html
    - `html`
- SQL
    - `sqls`



# Install LSP:
## lua - lua-language-server:

Ubuntu:
```bash
sudo apt install lua-language-server
```

Fedora:
```bash
mkdir -p ~/.local/share/lua-language-server
# Download release for linux 64
curl -L -o /tmp/lua_ls.tar.gz https://github.com/LuaLS/lua-language-server/releases/download/3.18.2/lua-language-server-3.18.2-linux-x64.tar.gz

tar -xzf /tmp/lua_ls.tar.gz -C ~/.local/share/lua-language-server

# Create a symlink to it in your local bin path so Neovim can instantly find it
mkdir -p ~/.local/bin
ln -sf ~/.local/share/lua-language-server/bin/lua-language-server ~/.local/bin/lua-language-server
```

## C++ (clangd)

Ubuntu:
```bash
sudo apt install clangd
```

Fedora:
```bash
sudo dnf install clang-tools-extra
```

## javascript (vtsls)
```bash
sudo npm install -g @vtsls/language-server
```

## html (html)
```bash
npm install -g vscode-langservers-extracted
```

## SQL (sqls)
```bash
go install github.com/sqls-server/sqls@latest
sudo ln -s $HOME/go/bin/sqls /usr/local/bin/sqls
```
