---
title: "How do I debug my code with VS Code?"
---

1. [Create a new VS Code Python profile](https://code.visualstudio.com/docs/configure/profiles#_create-a-profile) and activate it. This will install all recommended VS Code extensions for developing Python code.

1. Create a local development environment using the ["How to create a local environment"](#placeholder-link-to-how-to) guide. (Optional) You can create an environment with VS Code using the [Create Environment](https://code.visualstudio.com/docs/python/environments#_creating-environments) command.

1. [Activate your environment](#placeholder-link-to-activate-env) and install your project in editable mode. Optionally, also install dev requirements, if your project has them. To do this, you can run in a terminal:

    ```
    pip install -r <path/to/dev-requirements.txt>
    pip install -e .
    ```

1. Set up your VS Code Python interpreter to use the Python environment using the [Python: Select Interpreter](https://code.visualstudio.com/docs/python/environments#_working-with-python-interpreters) command.

1. Open the Python file you want to debug in VS Code. Familiarize yourself with the [Debugger user interface](https://code.visualstudio.com/docs/debugtest/debugging#_debugger-user-interface), which you can open by clicking on the Run and Debug icon in the left menu bar.

1. You can now start debugging. Set [Breakpoints](https://code.visualstudio.com/docs/debugtest/debugging#_breakpoints) by clicking in the gutter (the space to the left of the line numbers) or pressing F9 on the line where you want the debugger to pause execution.

1. For more detailed information about debugging in VS Code, refer to the [Debug code with Visual Studio Code](https://code.visualstudio.com/docs/debugtest/debugging) or the [Python debugging in VS Code](https://code.visualstudio.com/docs/python /debugging) documentation pages.
