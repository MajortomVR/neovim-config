# Dependencies

Needs a nerdfont installed.

Download a nerd font from https://www.nerdfonts.com for example.
(RobotoMono Nerd Font), download the zip package.

unzip into ~/.local/share/fonts/RobotoMono/

in the terminal execute afterwards:
```sh
fc-cache -fv
```

Afterwards open the gnome-terminal -> preferences -> Unnamed -> Custom Font: RobotoMono Nerd Font


# Installation

1) Install neovim

```sh
sudo dnf install nvim
```

2) Clone repository into ~/.config/nvim

```sh
git clone git@github.com:MajortomVR/neovim-config.git ~/.config/nvim
```
