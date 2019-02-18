# JS Stack on macOS Mojave

### Configuration Files

* .gitconfig
* (.bash_profile) .bashrc (with modularised scripts)
* .vimrc (using vundle - includes .vim/ folder)


### Installation

Install brew and vim

```bash
cd Development
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


### Install ASDF-VM

[Official Instructions](https://asdf-vm.com/#/)

Dependencies:

* coreutils
* automake
* autoconf
* openssl
* libyaml
* readline
* libxslt
* libtool
* unixodbc

### Install NodeJS:

[Official Instructions](https://github.com/asdf-vm/asdf-nodejs)

Dependencies:

* coreutils
* gpg

```bash
asdf install nodejs
```



