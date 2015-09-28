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

[Official Instructions](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)

Add the repository:

```bash
curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -
```

Enable `universe` repository:

```bash
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
```

Fix and update installed packages:

```bash
sudo dpkg --configure -a && sudo apt-get update && sudo apt-get -y upgrade
```

Install NodeJS:

```bash
sudo apt-get install -y nodejs
```



