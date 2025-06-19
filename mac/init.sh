# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/jwintersbro/.profile    
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install apps into `Applications` folder
brew install --cask bitwarden visual-studio-code github google-drive obsidian

# Install console tools
brew install rust zsh

# Setting shell to ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl https://raw.githubusercontent.com/ofgrenudo/confs/main/configurations/.zshrc -o ~/.zshrc
