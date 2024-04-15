sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y

# must-have dependencies
sudo apt install -y git ansible git-all curl zsh net-tools sysstat vnstat iotop iftop bwm-ng htop lolcat figlet 
git version

# https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
zsh --version
echo $SHELL # /usr/bin/zsh
sudo apt install -y zsh
chsh -s $(which zsh)
# Log out and log back in again
echo $SHELL
$SHELL --version
export ZSH="$HOME/.oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# change ~/.zshrc file following
