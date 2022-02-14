# Install FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install delta for git -diff
sudo dpkg -i git-delta_0.11.3_amd64.deb

# Install Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Check if python3 is install
which python3

# Install python3-pip
sudo apt-get install python3-pip

# Install pynvim
python3 -m pip install pynvim

# Install setuptools
sudo pip3 install setuptools
