# nf-complete

This tool improves Nextflow CLI user experience by suggesting parameters and scripts using an fzf search interface.

[![asciicast](https://asciinema.org/a/635917.svg)](https://asciinema.org/a/635917)


# Quick Start
Ensure your Nextflow script, includes usage instructions formatted in the [docopt](http://docopt.org/) style, enclosed by triple quotes. For example:
```groovy
def usage = """
Usage:

	nextflow run --input <input> [--outdir <outdir>]

Options:

	--input    Path to input CSV file
	--outdir   Path to output directory (optional)
	--help	   Show this message

"""
```

After typing your script with `nextflow run *.nf`, activate the parameter suggestion menu by pressing `Ctrl + n`.

To set up workflow script suggestions, edit the `.workflows` file in your `$HOME` directory. Add entries in the following format:

```
<key> <path to workflow script>
```

This allows for quick access to workflow scripts after typing `nextflow run`.

# Installation

1. First, you need to install [fzf](https://github.com/junegunn/fzf).
2. Clone this repository: `git clone https://github.com/5uperb0y/nf-tools`.
3. Open the `src/nf-complete/nf-complete.sh` in a text editor.
4. Set your preferred shortcut and path to your workflow list in the `nf-complete.sh` 
	```
	NF_COMPLETE_SHORTCUT="\C-n"
	NF_COMPLETE_WORKFLOWS="$HOME/.workflows"
	```
5. Add the following line to your `~/.bashrc` file:
	```
	source /path/to/nf-complete.sh
	```
6. Restart your terminal or run `source ~/.bashrc` to activate the changes.
7. Type your shortcut to open the workflow and paramter suggestion menu.