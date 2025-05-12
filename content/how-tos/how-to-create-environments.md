---
title: How to set up an environment
---

In this guide we summarize some key commands to set up an environment
with different tools that you might encounter in the scientific python
ecosystem. An environment is a workspace into which you can install Python
libraries, separate from what is being used by your operating system.

The environment managers that are covered in this how-to guide include:

- venv
- conda
- mamba
- uv
- pixi

In each of these examples we'll create a new virtual environment related to our
project called `science` (you can use whichever name you prefer!). We'll activate
the environment, install some dependencies, and see
an example of installing dependencies from an existing file. You may encounter
files like `requirements.txt`, `environment.yml` or `pyproject.toml` that specify
needed dependencies for a project.

### Set up a virtual environment with venv

With venv to create environment associated with a project folder called `science`.

```shell
python -m venv science
```

Start using it by activating it as follows:

```shell
source science/bin/activate
```

You are now ready to install Scientific Python packages using `pip`! For example:

```shell
pip install ipython numpy scipy
```

Often you'll interact with projects that have a specific list of dependencies (for development
environments, testing environments, or the project itself). You can install the list of dependencies
with pip in your venv using:

```shell
pip install -r <path/to/requirements.txt>
```

Remember to re-activate your environment every time you open a new terminal, using:

```shell
source science/bin/activate
```

You can find more information on using venv for packaging
[here](https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/).

### Set up an environment using conda

With conda, we can create a new environment named science (-n is the same as passing --name):

```shell
conda create -n science
```

Start using your environment by activating it:

```shell
conda activate science
```

You are now ready to install Scientific Python packages using `conda`!
For example:

```shell
conda install ipython numpy scipy
```

Some projects distribute environment files with listed dependencies with an `environment.yml` file.
The first line of this file sets the environment's name. To
create an environment and install the dependencies with this file, use:

```shell
conda env create -f <path/to/environment.yml>
```

Remember to re-activate your environment every time you open a new terminal:

```shell
conda activate science
```

You can find more information on using conda for environments
[here](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html).

### Set up an environment using mamba

With mamba, like conda, we can create a new environment named science (-n is the same as passing --name):

```shell
mamba create -n science
```

Start using your environment by activating it:

```shell
mamba activate science
```

You are now ready to install Scientific Python packages using `mamba`!
For example:

```shell
mamba install ipython numpy scipy
```

To install a specific environment from a `.yml` file, use:

```shell
mamba create -f </path/to/environment.yml>
```

Remember to re-activate your environment every time you open a new terminal:

```shell
mamba activate science
```

You can find more information on using mamba in the
[mamba user guide](https://mamba.readthedocs.io/en/latest/user_guide/mamba.html).

### Set up a virtual environment using uv

To create a new environment using uv in a project folder called `science`,
navigate to that folder and execute:

```shell
uv venv
```

Start using your environment by activating it:

```shell
source .venv/bin/activate
```

You are now ready to install Scientific Python packages using `uv`!
For example:

```shell
uv pip install ipython numpy scipy
```

To install dependencies from a requirements file, use:

```shell
uv pip install -f </path/to/requirements.txt>
```

Remember to re-activate your environment time you open a new terminal:

```shell
source <path/to/science/>.venv/bin/activate
```

You can find more information on using uv for environments
[here](https://docs.astral.sh/uv/pip/environments/#creating-a-virtual-environment).

### Set up a virtual environment using pixi

To initialize a new project with pixi in our project called `science`, execute:

```shell
pixi init
```

You are now ready to install Scientific Python packages as dependencies in this project!
From the science directory, execute:

```shell
pixi add ipython numpy scipy
```

To install dependencies from a file like `environment.yml`, use:

```shell
pixi init --import <path/to/environment.yml>
```

Remember to re-activate your environment when you re-open a terminal. Navigate to
the science folder, and execute:

```shell
pixi shell
```

This will drop you into the default environment for the pixi project, with all
dependencies in that environment accessible to you in that shell.

A pixi project may have multiple environments defined in the `pixi.toml` file. To
load a specific environment:

```shell
pixi shell --environment=<envname>
```

You can find more information on using pixi
[here](https://prefix.dev/docs/pixi/basic_usage).
