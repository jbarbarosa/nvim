
> The computing scientist's main challenge is not to get confused by the complexities of his own making.

\- Edsger W. Dijkstra

---
This config was created using Chris Chiarulli's base configuration. If you want his opinionated Neovim distro that just works, check out https://www.lunarvim.org/

His other works are here: https://github.com/ChristianChiarulli

This config of mine requires a tiny bit of patience to work, but if you're a Java developer, this has 100% all the configuration you need to run, test and debug Java. Say goodbye to Intellij.

## Install the config
- Install and source the path for nvim 0.10.x
- We need `ripgrep`, use your package manager for that: https://github.com/BurntSushi/ripgrep
- Install the tooling for your prefered languages (preferably through asdf https://github.com/asdf-vm/asdf)
  - This repo already supports Node, Go, Ruby, Java and Lua out of the box
- Install a Nerd Font, nerd
- Make sure to remove or backup your current `nvim` directory, then:
```sh
git clone https://github.com/jbarbarosa/nvim.git ~/.config/nvim
```
- Run `nvim` and wait for the plugins to be installed
- Run `:Mason` inside Neovim to ensure servers get installed

## Get healthy
Open `nvim` and enter the following:
```
:checkhealth
```

## Get to work
Press `space`, your leader key, to see a list of commands, and that's it!
