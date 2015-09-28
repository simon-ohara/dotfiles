# JS Stack on Ubuntu

### Configuration Files

* .gitconfig
* .bashrc (with modularised scripts)
* .vimrc (using vundle - includes .vim/ folder)


### Installation

```bash
sudo apt-get update
sudo apt-get install -y git vim
```

```bash
git clone git@github.com:simon-ohara/dotfiles.git
bash dotfiles/install
```

Finally ensure that the terminal is using the correct font for powerline/airline. 

`Terminal > Edit > Profile Preferences`

Set to one of the newly instaled powerline fonts (eg. Source Code Pro for Powerline Medium).

Reload the bashrc:

```bash
source ~/.bashrc
```

