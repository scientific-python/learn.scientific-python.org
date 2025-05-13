---
title: "How do I debug my code with VS Code?"
---

Most projects strongly encourage running tests locally before opening a pull request (or before pushing new commits to an existing PR).
<!-- This can save time (locally you can more easily select just one or a few tests that you expect to be relevant to / affected by your changes); it can also save money and other resources (many projects pay for their CI time). -->
When those tests fail, interactive debugging can help you figure out why.
1. To ensure you have all the needed VSCode extensions, [create a new VS Code profile](https://code.visualstudio.com/docs/configure/profiles#_create-a-profile) using the "Python" template profile, and activate it. (Advanced users might skip this step, if they know they already have a suitable profile that is active).

1. Create a local development environment using the ["How to create a local environment"](#placeholder-link-to-how-to) guide. (Optional) You can create an environment with VS Code using the [Create Environment](https://code.visualstudio.com/docs/python/environments#_creating-environments) command.

1. [Activate your environment](#placeholder-link-to-activate-env) and install your project in editable mode. Optionally, also install dev requirements, if your project has them. How you do this depends on the project; most will have a section in `pyproject.toml` listing optional developer dependencies; if so, install them by putting the optional dependencies group in brackets in the `pip` install command. For example, if the optional dependences are in a group called `dev`, you would run in a terminal `pip install -e .[dev]`. If instead the dev dependencies are in a separate requirements file, you would instead do:

   ```shell
   pip install -r <path/to/dev-requirements.txt>
   pip install -e .
   ```

1. Set up your VS Code Python interpreter to use the Python environment using the [Python: Select Interpreter](https://code.visualstudio.com/docs/python/environments#_working-with-python-interpreters) command.

1. Open the Python file you want to debug in VS Code. Familiarize yourself with the [Debugger user interface](https://code.visualstudio.com/docs/debugtest/debugging#_debugger-user-interface), which you can open by clicking on the Run and Debug icon in the left menu bar.

1. You can now start debugging. Set [Breakpoints](https://code.visualstudio.com/docs/debugtest/debugging#_breakpoints) by clicking in the gutter (the space to the left of the line numbers) or pressing F9 on the line where you want the debugger to pause execution. You'll see the breakpoint set when a red dot appears in the gutter. 

1. For more detailed information about debugging in VS Code, refer to the [Debug code with Visual Studio Code](https://code.visualstudio.com/docs/debugtest/debugging) or the [Python debugging in VS Code](https://code.visualstudio.com/docs/python/debugging) documentation pages.
