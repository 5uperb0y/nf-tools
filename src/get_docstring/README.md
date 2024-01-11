# get_docstring.py
Extract process and workflow docstring from Nextflow scripts.

## Quickstart
Run `get_docstring.py` with python as shown below:
```bash
$ python get_docstring.py workflow.nf
```
This will output the module type, name, and its associated comments. For example,

```bash
process FASTQC
this text is from FASTQC
workflow VARIANT_CALLING
this text is from VARIANT_CALLING
```
## Introduction
Docstrings is a feature in Python that allows developers to provide information and purpose of a function. Nextflow processes and workflows do not inherently have this feature. However, using multi-line comments (text between `/*` and `*/`) before any content in a process or workflow block helps developers describe the purpose, usage, and critical notes of the module.

Besides, placing these comments just above the main code of a module makes it more accessible for developers to modify them when making changes to the code.

Here is an example of multi-line comments in a Nextflow script. Only comments between module name and directives will be shown.

```groovy
process <name> {
	/* your comments */
	<process directive>
	"""
	<your code>
	"""
}
```
## Requirement
Ensure Python 3 is installed on your system to run this script.
```
python 3
```