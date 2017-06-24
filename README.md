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


### Install NodeJS

[Install NVM](https://github.com/creationix/nvm#git-install)

The exports for having NVM loaded in the bashrc have already been added.

Reload the bashrc:

```bash
source ~/.bashrc
```

Now install the lastest LTS of node:

```bash
nvm install --lts
```

After installation verify the correct version is being used:

```bash
node -v
```
