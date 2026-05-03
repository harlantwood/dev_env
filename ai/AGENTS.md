- When starting a server, wrap it with `script` so output is captured to a log file, e.g. `script -F -q ./tmp/log/dev.log SERVER_COMMAND`.  Unless it is rails, which does it's own log files.

- When running a ruby or bundler command, prefix with `eval "$(rbenv init -)" && <the command>` -- this ensures the correct ruby version is used.
- When running a node, npm, npx, yarn, pnpm, or bun command, prefix with `export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && <the command>` -- this ensures the correct Node version is used.
