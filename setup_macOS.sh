#!/bin/zsh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/george/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

# IDE section
brew install --cask clion
brew install --cask rider
brew install --cask pycharm
brew install --cask goland
brew install --cask webstorm
brew install --cask intellij-idea

brew install --cask visual-studio-code
brew install --cask docker
brew install --cask insomnia
brew install --cask pgadmin4

# Dotnet section
brew install mono
brew tap isen-ng/dotnet-sdk-versions
brew install --cask dotnet-sdk6-0-400
brew install --cask dotnet-sdk7-0-100

# Other section
brew install neovim
brew install --cask sublime-text
brew install --cask figma
brew install --cask notion
brew install --cask discord
brew install --cask onlyoffice
brew install --cask sf-symbols


# Terminal section
brew install --cask iterm2
brew install tmux
brew install romkatv/powerlevel10k/powerlevel10k
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo 'source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >>! ~/.zshrc
echo 'source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >>! ~/.zshrc
echo 'source $(brew --prefix powerlevel10k)/powerlevel10k.zsh-theme' >>! ~/.zshrc

echo 'Dont forget install from App store:
\t davinci-resolve
\t telegram
\t xcode
\t ms-remote-desktop
\t pages
\t keynote
\t numbers'


