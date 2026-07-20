- When starting a server, wrap it with `script` so output is captured to a log file, e.g. `script -F -q ./tmp/log/dev.log SERVER_COMMAND`.  Unless it is rails, which does it's own log files.

- mise is the version manager for both ruby and node. It activates whatever the directory pins in `.tool-versions`, `.ruby-version`, `.nvmrc`, or `.node-version`, so ruby, bundler, node, npm, npx, yarn, pnpm, and bun need no prefix -- just run them. (rbenv and nvm are both retired; do not source `nvm.sh` or `rbenv init`.)
- If a command lands on the wrong version -- e.g. a non-interactive shell that did not run `mise activate` -- prefix it with `mise exec -- <the command>`, which resolves the same pins explicitly.
