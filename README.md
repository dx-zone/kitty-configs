# Kitty Configurations
This repository contains custom configurations, themes, scripts, and backgrounds for the [Kitty terminal emulator](https://sw.kovidgoyal.net/kitty/). These settings are designed to enhance your terminal experience with improved visuals, functionality, and a modern, personalized aesthetic.
## ⚡ Features
✨ Highlights of what's included in this repository:
- **Custom Themes**:
    - Beautiful themes like Catppuccin, TokyoNight, CyberDream, and Oxocarbon included.
    - Themes are stored in the `themes/` directory for easy accessibility.

- **Dynamic Backgrounds**:
    - Personalize your terminal with custom backgrounds available in the `backgrounds/` directory.
    - Includes scripts for automatically cycling through backgrounds.

- **Enhanced Configurations**:
    - Modular `kitty.conf` for improved terminal behavior.
    - Features include:
        - Profile switching.
        - Transparent terminal toggle.
        - Keyboard shortcuts optimized for productivity.

- **Useful Scripts**:
    - A collection of scripts to add advanced functionality and simplify tasks.

## 🚀 Installation and Setup
Follow these simple steps to install and use these configurations with Kitty:
### Step 1: Install Kitty
Ensure Kitty terminal is installed on your system. You can find installation instructions in the [official documentation](https://sw.kovidgoyal.net/kitty/).
On macOS, you can install Kitty using Homebrew:
``` bash
brew install --cask kitty
```
### Step 2: Clone the Repository
Clone this repository to your local machine:
``` bash
git clone https://github.com/dx-zone/kitty-configs.git
cd kitty-configs
```
### Step 3: Copy or Symlink Configurations
Copy the contents of this repository to your Kitty configuration directory. On macOS, this directory is typically located at:
``` 
~/.config/kitty
```
To copy the configurations:
``` bash
cp -r * ~/.config/kitty
```
Alternatively, use a symbolic link to keep the repository updated dynamically:
``` bash
ln -s $(pwd) ~/.config/kitty
```
### 🖌️ Step 4: Launch Kitty with the Custom Configurations
Simply start Kitty, and it will automatically load the configurations:
``` bash
kitty
```
You should now see Kitty running with all the custom themes, settings, and scripts applied.
### Step 5: Adjust as Needed
Feel free to explore the repository and customize configurations to suit your preferences. For example:
- Update the colorscheme in `kitty.conf` to one of the themes available in the `themes/` directory.
- Add/remove custom scripts as needed.

## 📂 Repository Structure
- **`kitty.conf`**: The main configuration file for Kitty with modular settings.
- **`themes/`**: A collection of terminal themes ready to use, such as Catppuccin and Oxocarbon.
- **`backgrounds/`**: Background images for Kitty to make your terminal visually stunning. Dynamic scripts included for auto-cycling.
- **`scripts/`**: Handy scripts to enhance functionality, like auto-theme switching or background updates.

## 📜 License
This repository is distributed under the included license. Feel free to modify and reuse these configurations, but attribution would be appreciated!
If you encounter any issues or have suggestions to improve the setups, feel free to open an issue or create a pull request in the GitHub repository.

