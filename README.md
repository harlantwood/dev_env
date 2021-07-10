# dev_env

A collection of git, and bash utilities, prompts, etc. Opinionated but simple and hackable.

## 30 second install

You can install it anywhere; in the instructions below just change ~/.dev_env to any directory you wish.

In home dir:

    git clone https://github.com/harlantwood/dev_env.git .dev_env
    # or:
    git clone git@github.com:harlantwood/dev_env.git .dev_env

in your ~/.bash_profile or similar:

    . ~/.dev_env/shell_ext_mac_zsh.sh

To set up `.gitconfig` and `.gitignore`:

    cd ~
    ln -s .dev_env/.gitconfig
    ln -s .dev_env/.gitignore

To set up vscode settings:

    cd ~/Library/Application\ Support/Code/User
    ln -sf ~/.dev_env/vscode/home-lib-app-sup-code-user/settings.json

To set up IntelliJ keymap:

    cd ~/Library/Preferences/IntelliJIdea[VERSION]/keymaps
    ln -s ~/.dev_env/keymap_idea_osx_custom.xml
