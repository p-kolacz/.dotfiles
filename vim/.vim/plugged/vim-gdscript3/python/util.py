# Miscellaneous utility functions

import os
import vim
import re

import util
import script
import classes

# Some commonly used values are cached every time completion is invoked
# to minimize vim calls.
_cursor_line_num = None
_cursor_col_num = None
_base = None
_ignore_case = None

_project_dir = None

def clear_cache():
    global _cursor_line_num
    global _cursor_col_num
    global _base
    global _ignore_case
    _cursor_line_num = None
    _cursor_col_num = None
    _base = None
    _ignore_case = None

def get_cursor_line_num():
    global _cursor_line_num
    if not _cursor_line_num:
        _cursor_line_num = int(vim.eval("line('.')"))
    return _cursor_line_num

def get_cursor_col_num():
    global _cursor_col_num
    if not _cursor_col_num:
        _cursor_col_num = int(vim.eval("col('.')"))
    return _cursor_col_num

def get_base():
    global _base
    if not _base:
        _base = vim.eval("a:base")
    return _base

def get_ignore_case():
    global _ignore_case
    if not _ignore_case:
        ic = int(vim.eval("&ignorecase"))
        sc = int(vim.eval("&smartcase"))
        _ignore_case = ic and (not sc or not any(x.isupper() for x in get_base()))
    return _ignore_case

def get_line(line_num=None):
    if not line_num:
        line_num = get_cursor_line_num()
    return vim.eval("getline({})".format(line_num))

def get_indent(line_num):
    cur_line_num = get_cursor_line_num()
    cur_col_num = get_cursor_col_num()
    indent = int(vim.eval("indent({})".format(line_num)))
    if line_num == cur_line_num and cur_col_num < indent:
        return cur_col_num
    else:
        return indent

def get_syn_attr(line_num=None, col_num=None):
    if not line_num:
        line_num = get_cursor_line_num()
    if not col_num:
        col_num = get_cursor_col_num() - 1
    return vim.eval("synIDattr(synID({}, {}, 1), 'name')".  format(line_num, col_num))

def get_line_count():
    return int(vim.eval("line('$')"))

def filter(s):
    base = get_base()
    ignore_case = get_ignore_case()
    return not base or re.match(base, s, re.I if ignore_case else 0)

# Remove comment and trailing whitespace from a line.
def strip_line(lnum, line):
    # Check if a comment is present.
    # Since comments extend all the way to the end of the line, all we have to
    # do is check the syntax attribute of the last character.
    if get_syn_attr(lnum, len(line)) != "gdComment":
        return line.rstrip()
    # Search for the start of the comment.
    for i, char in enumerate(line):
        if char == "#" and get_syn_attr(lnum, i+1) == "gdComment":
            return line[0:i].rstrip()

# Get the root directory of the current Godot project.
# Once retrieved, the path is cached indefinitely.
def get_project_dir():
    global _project_dir
    if not _project_dir:
        cwd = os.getcwd()
        os.chdir(vim.eval("expand('%:p:h')")) # Directory of current file.
        try:
            while not os.path.isfile("project.godot"):
                os.chdir("..")
                if os.getcwd() == "/":
                    return
            _project_dir = os.getcwd()
        except:
            pass
        finally:
            os.chdir(cwd)
    return _project_dir

