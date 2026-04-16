- When starting a server, wrap it with `script` so output is captured to a log file, e.g. `script -F -q ./tmp/log/dev.log SERVER_COMMAND`.  Unless it is rails, which does it's own log files.

- When running a ruby or bundler command, prefix with `eval "$(rbenv init -)" && <the command>` -- this ensures the correct ruby version is used.
