# prj.fish

**prj.fish** is a Fish plugin for quickly jumping between your Git project directories using [fd](https://github.com/sharkdp/fd) and [fzf](https://github.com/junegunn/fzf).

## Features

- Fuzzy search your Git project folders with `fzf`
- Automatically detects projects by searching for `.git` directories
- Simple command-line interface with help and version flags

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```fish
fisher install mattmc3/prj.fish
```

Make sure you have [Fish shell](https://fishshell.com/), [fd](https://github.com/sharkdp/fd), and [fzf](https://github.com/junegunn/fzf) installed.

## Usage

```fish
prj [<query>]
```

- Run `prj` to interactively select a project.
- Use a query to filter projects.
- Use `-h` or `--help` for usage info.
- Use `-v` or `--version` for version info.

## Example

```fish
prj
prj myproject
```

## Configuration

By default, `prj.fish` searches for projects in `$HOME/Projects`.
You can override this by setting the `PRJ_DIR` environment variable:

```fish
set -gx PRJ_DIR /path/to/your/projects
```

## License

MIT License

---

Inspired by project jumpers in other shells.
