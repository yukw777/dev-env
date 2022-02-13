# Development Environment Setup
## Editor
I use [Visual Studio Code](https://code.visualstudio.com/).

### Extensions
- [Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim) - Vim Keybindings
- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) - Python Language Support
- [Go](https://marketplace.visualstudio.com/items?itemName=ms-vscode.Go) - Go Language Support
- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) - Latex Build and Preview
- [erlang](https://marketplace.visualstudio.com/items?itemName=pgourlain.erlang) - Erlang Language Support
- [Better TOML](https://marketplace.visualstudio.com/items?itemName=bungcip.better-toml) - TOML Language Support
- [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=matklad.rust-analyzer) - Rust Language Support
- [CodeLLDB](https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb) - Debugger Based on LLDB for Compiled Languages like Rust and C++
- [Visual Studio IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.VSIntelliCode) - AI-assisted IntelliSense for Python, TypeScript/JavaScript and Java.
- [Foam](https://foambubble.github.io/foam/) recommended extensions.
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)

### Configurations
#### Key Bindings
- MacOS: Copy [keybindings-macos.json](vscode/keybindings-macos.json) to to the appropriate location.
- Ubuntu: Copy [keybindings-ubuntu.json](vscode/keybindings-ubuntu.json) to to the appropriate location.

#### Settings
Copy [settings.json](vscode/settings.json) to the appropriate locations.

## Terminal
For MacOS, I use [iTerm2](https://iterm2.com/).

## Shell - zsh
### Installation
I use zsh with [ohmyzsh](https://ohmyz.sh/). Follow the instructions [here](https://github.com/ohmyzsh/ohmyzsh/wiki) to install both. I also use the [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme. Follow the instructions on its README to install. It comes with a nice installation wizard, so it should be quite simple. For Ubuntu, you do need to install the recommended fonts manually, and the instructions are [here](https://github.com/romkatv/powerlevel10k#manual-font-installation).

## SSH Agent
For MacOS, simply follow the instructions [here](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) to add the ssh key to the ssh agent.

For Ubuntu, install `keychain` (`sudo apt install keychain`) and add the following at the bottom of `~/.zshrc`:
```
# keychain for Ubuntu
eval `keychain --eval --quiet --agents ssh id_rsa`
```

## CUDA
PyTorch comes packaged with its own CUDA runtime, so you typically don't need to install a separate system-wide CUDA. However, some libraries (e.g. pytorch-geometric) may require a system-wide CUDA installation. You can install CUDA 11.5 by following the commands below:
```
# Disable Nouveau driver
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo update-initramfs -u
sudo reboot
# check nouveau is not running
lsmod | grep nou

# You may need to remove the Nvidia drivers installed by the package manager
sudo apt remove --purge '^nvidia-.*'
sudo apt autoremove
sudo reboot

# Install CUDA 11.5
# From https://developer.nvidia.com/cuda-downloads
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo apt-get update
sudo apt-get -y install cuda

# Remove old installations (if at all) by running one of the commands below (whatever is available)
sudo /usr/local/cuda-x.x/bin/uninstall_cuda_x.x.pl
sudo /usr/local/cuda-x.x/bin/cuda-uninstaller
```

You may have to add the following to your `~/.zshrc`:
```bash
# Add CUDA paths
export PATH=$PATH:/usr/local/cuda/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
```
