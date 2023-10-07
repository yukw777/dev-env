# Development Environment Setup

## OS Key Mapping

I remap Caps Lock to Left Ctrl.

- Windows: Use [Microsoft PowerToys](https://apps.microsoft.com/store/detail/microsoft-powertoys/XP89DCGQ3K6VLD)'s Keyboard Manager.
- Mac: System Preferences => Keyboard => Modifier Keys.
- Ubuntu: `sudo apt install gnome-tweak-tool` => `gnome-tweaks` => Keyboard & mouse => Additional Layout Options => Ctrl position => Swap Ctrl and Caps Lock.

## Editor

### [Visual Studio Code](https://code.visualstudio.com/)

#### Extensions

- [Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim) - Vim Keybindings
- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) - Python Language Support
- [Go](https://marketplace.visualstudio.com/items?itemName=ms-vscode.Go) - Go Language Support
- [erlang](https://marketplace.visualstudio.com/items?itemName=pgourlain.erlang) - Erlang Language Support
- [Better TOML](https://marketplace.visualstudio.com/items?itemName=bungcip.better-toml) - TOML Language Support
- [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=matklad.rust-analyzer) - Rust Language Support
- [CodeLLDB](https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb) - Debugger Based on LLDB for Compiled Languages like Rust and C++
- [Visual Studio IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode) - AI-assisted IntelliSense for Python, TypeScript/JavaScript and Java.
- [Foam](https://foambubble.github.io/foam/) recommended extensions.
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) - Javascript/Typescript formatter
- [Mypy](https://marketplace.visualstudio.com/items?itemName=matangover.mypy) - Mypy extension, better than the built-in
- [Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) - Launch a development local server. Useful for previewing HTML files over SSH
- [C#](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp) - C# Language Support
- [CSharpier](https://marketplace.visualstudio.com/items?itemName=csharpier.csharpier-vscode) - Auto-format C# code using CSharpier
- [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv) - CSV syntax highlighting

#### Key Bindings

- MacOS: Copy [keybindings-macos.json](vscode/keybindings-macos.json) to to the appropriate location.
- Ubuntu: Copy [keybindings-ubuntu.json](vscode/keybindings-ubuntu.json) to to the appropriate location.

#### Settings

Copy [settings.json](vscode/settings.json) to the appropriate locations.

### [Visual Studio](https://visualstudio.microsoft.com/)

#### Extensions

- [VsVim](https://marketplace.visualstudio.com/items?itemName=JaredParMSFT.VsVim) - Vim Keybindings
- [CSharpier](https://marketplace.visualstudio.com/items?itemName=csharpier.CSharpier) - Auto-format C# code using CSharpier

#### Key Bindings

First, have `VsVim` manage the following key bindings:

- Ctrl+[
- Ctrl+B
- Ctrl+F
- Ctrl+R
- Ctrl+V
- Ctrl+W

Second, search for `key bindings` to bring up the keyboard settings (Environment > Keyboard), then modify the following:

- `Edit.LineUp` => Ctrl+K: Move up in the suggestions.
- `Edit.LineDown` => Ctrl+J: Move down in the suggestions.

Lastly, copy `.vsvimrc` to `C:\Users\<username>`.

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
# Check if nouveau is running
lsmod | grep nou
# If running, disable Nouveau driver
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo update-initramfs -u
sudo reboot

# You may need to remove the Nvidia drivers installed by the package manager
sudo apt remove --purge '^nvidia-.*'
sudo apt autoremove
sudo reboot

# Install latest CUDA by following the instructions on https://developer.nvidia.com/cuda-downloads

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

## Poetry

By default, `poetry` is installed in `$HOME/.local/bin`, so it's a good idea to add the following to your `~/.zshrc`:

```bash
# Add ~/.local/bin (mostly for Poetry)
export PATH=$PATH:$HOME/.local/bin
```

## .NET

The path for .NET global tools is not automatically added, so you may have to add the following to your `~/.zshrc`:

```bash
# Add ~/.dotnet/tools for dotnet tools
export PATH=$PATH:$HOME/.dotnet/tools
```
