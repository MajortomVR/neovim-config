# Dependencies

## Nerdfont

Download a nerd font from https://www.nerdfonts.com for example.
(RobotoMono Nerd Font), download the zip package.

unzip into ~/.local/share/fonts/RobotoMono/

in the terminal execute afterwards:
```sh
fc-cache -fv
```

Afterwards open the gnome-terminal -> preferences -> Unnamed -> Custom Font: RobotoMono Nerd Font

## tree-sitter-cli for nvim-treesitter
```sh
npm install -g tree-sitter-cli
```


# Installation

1) Install neovim

```sh
sudo dnf install nvim
```

2) Clone repository into ~/.config/nvim

```sh
git clone git@github.com:MajortomVR/neovim-config.git ~/.config/nvim
```

# Adding LSPs

1) Add a language server in mason.lua by adding them to the ensure_installed list.
2) To check the lsp `:checkhealth vim.lsp`
