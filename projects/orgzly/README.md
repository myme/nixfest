# Orgzly

[Orgzly](https://github.com/orgzly/orgzly-android) and [Orgzly
Revived](https://github.com/orgzly-revived/orgzly-android-revived) are Android
apps intended to be used with [Org Mode](https://orgmode.org/) notes.

## Build

1. Setup `direnv` with symlinking [./envrc](./envrc) and
   [./shell.nix](./shell.nix) into the Orgzly repo. Then either use `direnv` or
   `nix develop` to enter a development shell.

2. Fire up Android studio:

   ``` sh
   nixon android-studio
   ```

