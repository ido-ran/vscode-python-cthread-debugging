# Prepare venv

I tested this on Windows 10 WSL but this should work on Linux and Mac as well.

Install python3.8-dev `sudo apt-get install python3.8-dev`

# Reproduce the bug

1. Run `create-venv.sh` once to create venv
1. Run `build_thrd.sh` to build Cyton extension
1. Open `test_threading.py` in VS Code
1. Add breakpoint on the `print` statement in `handler` function
1. Start debug by pressing F5 or open the Run tab and click Start Debugging

The expected behavior is that the debugger will break, but it will not.

## Workaround

You can uncomment the `breakpoint()` statement in the `handler` function and then the debugger will break.
