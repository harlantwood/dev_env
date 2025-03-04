# dev_env

A collection of git, and bash utilities, prompts, etc. Opinionated but simple and hackable.

You can install it anywhere; in the instructions below **just change ~/.dev_env to any directory you wish.**

In home dir [cd ~] or Directory of your choosing:

    git clone https://github.com/harlantwood/dev_env.git .dev_env
    # or:
    git clone git@github.com:harlantwood/dev_env.git .dev_env

---

## _30 second install for bash extensions, git config, idea keymap_

Copy the following into your ~/.zshrc (or ~/.bash_profile or similar):

    . ~/.dev_env/shell_ext_mac_zsh.sh

To set up `.gitconfig` and `.gitignore`:

    cd ~
    ln -s .dev_env/.gitconfig
    ln -s .dev_env/.gitignore

To set up p10k prompt:

    cd ~
    ln -s .dev_env/.p10k.zsh

To set up vscode or cursor or windsurf settings:

    cd ~/Library/Application\ Support/Code/User
    # OR if Cursor:
    cd ~/Library/Application\ Support/Cursor/User
    # OR if Windsurf:
    cd ~/Library/Application\ Support/Windsurf/User

    ln -sf ~/.dev_env/vscode/home-lib-app-sup-code-user/settings.json
    ln -sf ~/.dev_env/vscode/home-lib-app-sup-code-user/keybindings.json

To back up vscode extensions:
```console
cd ~/.dev_env
code --list-extensions >> vscode/extensions.txt
```

And to reinstall them elsewhere:

    cat vscode/extensions.txt | xargs -n 1 code --install-extension

To set up IntelliJ keymap:

    cd ~/Library/Preferences/IntelliJIdea[VERSION]/keymaps
    ln -s ~/.dev_env/keymap_idea_osx_custom.xml
