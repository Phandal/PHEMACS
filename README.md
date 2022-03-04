# PHEMACS

My slightly customized emacs config that I use daily.

## Table of Contents
1. [Overview](#overview)
2. [Dependencies](#dependencies)
3. [Installation](#installation)
4. [Packages](#packages)
5. [FAQ](#FAQ)

## Overview
To start, I am a vim/neovim user. After using vim/neovim since 2019 I decided to actually give emacs a shot. This config is just my way of learning emacs-lisp and using emacs. By no means is this perfect as I'm still quite new to emacs and I don' know everything (But do you ever really know everything about emacs?). My main focus is trying to make this config work for both my work pc as well as my personal pc. My work computer uses emacs for windows and my personal computer uses native comp emacs on Linux. I spent to much time trying to manage 2 or 3 different repos for my work vs personal configs in vim/neovim and needed to find a better solution.

## Dependencies
- CaskcaydiaCove Nerd Font
  I use this and don't really have a good way of checking for fonts right now so you will probably have to change this in the config file
- ripgrep

## Installation

1. Clone this repo
``` bash
git clone https://github.com/Phandal/PHEMACS.git
```
2. Run install.sh
``` bash
cd PHEMACS
install.sh
```

## Packages
| Package | Usage |
| ------- | ----- |
| straight| Package Manager |
| doom-themes | Package containing lots of themes |
| all-the-icons | Makes emacs use cool icons |
| helpful | Better help package |
| which-key | Shows keybinds |
| vertico | Selection framework |
| marginalia | More info in minibuffer |
| consult | Adds more functions that use completion |
| embark | Adds actions to consult |
| embark-consult | Adds more actions to consult |
| orderless | Changes the way completions are shown |
| neotree | Folder Explorer |
| magit | Git frontend |
| vterm | Terminal Emulator ***(Linux only)*** |

## FAQ
**Q: But Phandal, I thought you said you were a vim/neovim user. Why aren't you using Evil-Mode?**

**A: Well, to be honest with you, I don't want to configure all of that right now. Plus, I think its worth it to be familar with the emacs keybindings.**
