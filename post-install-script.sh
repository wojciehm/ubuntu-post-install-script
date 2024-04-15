sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y

# must-have dependencies
sudo apt install -y git ansible git-all curl zsh net-tools sysstat vnstat iotop iftop bwm-ng htop lolcat figlet ntpdate
git version

#download ansible repo
git clone https://github.com/wojciehm/ansible.git

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
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 1. MOTD Setup
mkdir -p ~/motd-backup
sudo mv /etc/update-motd.d/* ~/motd-backup/
sudo cp ../ansible/motd/* /etc/update-motd.d/

# 2. Copy lolcat
sudo cp /usr/games/lolcat /usr/bin

# 3. Timezone and Locale Settings
sudo timedatectl set-timezone Europe/Berlin
sudo locale-gen en_US.UTF-8  # Generate the locale
sudo update-locale LANG=en_US.UTF-8  # Set the system locale

#Set history to 10000
set -o history   # Enable history expansion
HISTFILE=~/.bash_history  # Set the location of the history file
HISTSIZE=10000             # Increase history size (optional)
