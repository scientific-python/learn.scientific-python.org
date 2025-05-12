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
pip install -r requirements.txt
```

Remember to re-activate your environment every time you open a new terminal, using:

```
source science/bin/activate
```

### Set up a virtual environment using conda 

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

Often you'll interact with projects that have a specific list of dependencies (for development 
environments, testing environments, or the project itself). You can install the list of dependencies
with conda in your environment using: 

```
conda install --file requirements.txt
```

Remember to re-activate your environment every time you open a new terminal:

```
conda activate science
```

### Set up a virtual environment using mamba 

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

Often you'll interact with projects that have a specific list of dependencies (for development 
environments, testing environments, or the project itself). You can install the list of dependencies
with mamba in your environment using: 

```
mamba install --file requirements.txt
```

Remember to re-activate your environment every time you open a new terminal:

```
mamba activate science
```
