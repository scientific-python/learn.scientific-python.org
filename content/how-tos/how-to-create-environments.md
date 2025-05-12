---
title: How to set up a virtual environment
---

In this guide we summarize some key commands to set up a virtual environment
with different tools in the scientific python ecosystem. 
A virtual environment is a workspace into which you can install Python
libraries, separate from what is being used by your operating system.

The environment managers that are covered in this how-to guide include:
- venv
- conda
- mamba
- uv
- pixi

In each of these examples we'll create a new virtual environment related to our project called `science` 
(you can use whichever name you prefer!). We'll activate the environment, install some dependencies, and see 
an example of installing dependencies from a file. 

### Set up a virtual environment with venv

With venv we'll have our virtual environment associated with our project folder called `science`. 

```
python -m venv science
```

Start using it by activating it as follows:

```
source science/bin/activate
```

You are now ready to install Scientific Python packages using `pip`! For example:

```
pip install ipython numpy scipy
```

Often you'll interact with projects that have a specific list of dependencies (for development 
environments, testing environments, or the project itself). You can install the list of dependencies
with pip in your venv using: 

```
pip install -r <path/to/requirements.txt>
```

Remember to re-activate your environment every time you open a new terminal, using:

```
source science/bin/activate
```

### Set up an environment using conda 

With conda, we can create a new environment named science (-n is the same as passing --name):

```
conda create -n science
```

Start using your environment by activating it: 

```
conda activate science
```

You are now ready to install Scientific Python packages using `conda`!
For example:

```
conda install ipython numpy scipy
```

Some projects distribute environment files with listed dependencies with an `environment.yml` file. 
The first line of this file sets the environment's name. To
create an environment and install the dependencies with this file, use: 

```
conda env create -f <path/to/environment.yml>
```

Remember to re-activate your environment every time you open a new terminal:

```
conda activate science
```

### Set up an environment using mamba 

With mamba, like conda, we can create a new environment named science (-n is the same as passing --name):

```
mamba create -n science
```

Start using your environment by activating it: 

```
mamba activate science
```

You are now ready to install Scientific Python packages using `mamba`!
For example:

```
mamba install ipython numpy scipy
```

To install a specific environment from a `.yml` file, use: 

```
mamba create -f </path/to/environment.yml>
```

Remember to re-activate your environment every time you open a new terminal:

```
mamba activate science
```

### Set up a virtual environment using uv 

To create a new environment using uv in our project folder called `science`:  

```
uv venv
```

Start using your environment by activating it: 

```
source .venv/bin/activate
```

You are now ready to install Scientific Python packages using `uv`!
For example:

```
uv pip install ipython numpy scipy
```

To install dependencies from a requirements file, use: 

```
uv pip install -f </path/to/requirements.txt>
```

Remember to re-activate your environment time you open a new terminal:

```
source <path/to/science/>.venv/bin/activate
```

You can find more information on using uv for environments 
[here](https://docs.astral.sh/uv/pip/environments/#creating-a-virtual-environment).

### Set up a virtual environment using pixi 

To initialize a new project with pixi in our project called `science`, execute:   

```
pixi init 
```

You are now ready to install Scientific Python packages as dependencies in this project!
From the science directory, execute:

```
pixi add ipython numpy scipy
```

To install dependencies from a file like `environment.yml`, use: 

```
pixi init --import <path/to/environment.yml>
```

Remember to re-activate your environment when you re-open a terminal. Navigate to 
the science folder, and execute:

```
pixi shell 
```

A pixi project may have multiple environments defined in the `pixi.toml` file. To 
load a specific environment: 

```
pixi shell --environment=<envname> 
```

You can find more information on using pixi  
[here](https://docs.astral.sh/uv/pip/environments/#creating-a-virtual-environment).






