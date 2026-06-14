# depthfinder

depthfinder (`dfn`) is a free (as in freedom and price) [boxflinger](https://codeberg.org/ideumi/boxflinger) based, (mostly) zero-config file manager that runs in the terminal. It is written in [ChipLang](https://codeberg.org/ideumi/chip-go). It is primarily meant to operate in a terminal emulator on top of an X11 or Wayland session, parallel to GUI tools, though it can run solely in a tty environment. `dfn` has close to no external dependencies and works entirely using the ChipLang runtime and corelib.

### [Download depthfinder](https://codeberg.org/ideumi/depthfinder/releases)

## Screenshots

<p align="left">
  <img src="media/screensh_browser.png" alt="File Browser" width="512">
  <img src="media/screensh_marked.png" alt="Marked Files" width="512">
</p>

<p align="left">
  <img src="media/screensh_search.png" alt="Search" width="512">
  <img src="media/screensh_info.png" alt="File Info" width="512">
</p>

<p align="left">
  <img src="media/screensh_sort.png" alt="Sort Menu" width="512">
</p>

## Features

- Easy to use
- Two-panel layout with sidebar bookmarks and file browser
- File operations: copy, cut, paste, delete, rename, create files and directories
	- Bulk rename
	- File conflict resolution
- Multi-select with mark/unmark and select all
- Interactive file and directory search
- Sorting
- File info dialog
- File type color coding
- Symlink-aware
- Configurable file associations
- Compress files and directories
- Run shell commands
- Bookmark management
- Dynamic window titles (for supporting terminals)

## Requirements

- [ChipLang](https://codeberg.org/ideumi/chip-go) >= 1.0.19
- make

## Building

```bash
mkdir out
chippy combine

# or
make
```

## Installation on FHS-Distros

```bash
mkdir out
sudo make install
```

## Uninstallation on FHS-Distros

```bash
mkdir out
sudo make uninstall
```

## Usage

```bash
# Run the installed bundle
dfn

# Run the built bundle
./out/dfn
```

## Configuration

> **TLDR**; You probably want to configure your preferred terminal emulator command in `~/.dfn-terminal`.

depthfinder uses four config files, all created with defaults on first run:

- `~/.dfn-bookmarks` -- Bookmarks, one per line as `name;path` 
	- Configure this via the sidebar, not manually

- `~/.dfn-terminal` -- Terminal emulator command
	- Enter the command of your preferred terminal emulator here

- `~/.dfn-file-associations` -- File associations as `extension;command` e.g.:

```
flac;vlc
ogg;vlc
```

- `~/.dfn-lastdir` -- Last visited directory for session restore
	- This is saved automatically, no need to edit this manually

> Unconfigured file endings just run via `xdg-open`.

### Foreground Programs

Commands prefixed with `!` are run in the foreground, with direct control of the terminal. 
This works in file associations and in the "Open With" (`o`) prompt. 

Use this for TUI programs like editors:

```
txt;!vim
md;!less
```

Commands without the prefix are `Spawn(command)`'ed in the background.

## Known Issues

- Window resizing logic does not trigger when and dialog is open, only after it is closed
	- This is intentional for now and is probably a bigger refactor, not sure if this is worth yet
		- boxflinger would need to support (?)

- constants.chh: `COPYCHUNKSIZE`: works fine on my hardware, but will likely block more when copying files on slower or different type of hardware	
	- I'll maybe have the actual copying in an actor at some point so the UI refresh isn't bound to fwrite blocking

## License

`depthfinder` is licensed under the 2-Clause BSD License. See `LICENCE.txt`.
