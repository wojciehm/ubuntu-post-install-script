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

# 1. Create the motd-backup folder in the user's home directory
mkdir -p ~/motd-backup

# 2. Move existing motd files to the backup folder
sudo mv /etc/update-motd.d/* ~/motd-backup/

# 3. Clone the GitHub repository
git clone https://github.com/wojciehm/ansible

# 4. Copy motd files from the repository
sudo cp ansible/motd/* /etc/update-motd.d/

# 5. Remove the cloned repository (optional for cleanup)
rm -rf ansible

# 6. Copy lolcat (you'll need to ensure lolcat is installed first)
sudo cp /usr/games/lolcat /usr/bin
