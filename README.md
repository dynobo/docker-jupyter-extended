# docker-jupyter-extended

***Docker image containing JupyterLab, several extensions, and additional Python packages***

I use this to jump-start my notebook projects.

Built from `jupyter/scipy-notebook` base image, extended by the following packages:

## JupyterLab Extensions

- `@ijmbarr/jupyterlab_spellchecker` (en_US spell checker)
- `jupyterlab-flake8` (Linter)
- `@ryantam626/jupyterlab_code_formatter` (Auto code formatting)
- `@jupyterlab/toc` (Table of contents)
- `@krassowski/jupyterlab_go_to_definition` (Alt+click goes to object definition)
- `@lckr/jupyterlab_variableinspector` (Live view of program variables)

## Python Libraries

- `black` (Formatter)
- `flake8` (Linter)
