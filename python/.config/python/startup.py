import atexit
import os
import readline

histfile = os.path.join(os.path.expandvars("$XDG_STATE_HOME"), "python_history")
try:
    readline.read_history_file(histfile)
    # default history len is -1 (infinite), which may grow unruly
    readline.set_history_length(10000)
except FileNotFoundError:
    pass

atexit.register(readline.write_history_file, histfile)

