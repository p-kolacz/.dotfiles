import sys
import re
import vim

sys.path.append(vim.eval("expand('<sfile>:p:h')") + "/../python/")

import util
import completer
import classes
import script

def gdscript_complete():
    util.clear_cache()
    completer.clear_completions()

    line = util.get_line()[0:util.get_cursor_col_num() - 1]
    syn_attr = util.get_syn_attr()
    if syn_attr == "gdComment":
        return
    elif syn_attr == "gdString":
        completer.complete_paths()
    elif re.match("(\s*class\s+\w+\s+)?extends\s*", line):
        completer.complete_class_names(classes.EXTENDABLE)
    elif re.match("export\(\s*", line):
        completer.complete_class_names(classes.EXPORTABLE)
    elif re.match("\s*func", line):
        completer.complete_method_signatures()
    elif line and line[-1] == ".":
        completer.complete_dot()
    else:
        completer.complete_script(include_globals=True)

    completions = completer.get_completions()
    vim.command("let gdscript_completions = " + str(completions))

def echodoc_search():
    util.clear_cache()

    text = vim.eval("a:text")
    text_len = len(text)
    if text_len == 0:
        return

    m = re.match("\w+", text)
    if not m:
        return
    method_name = m.group(0)

    chain_start = util.get_cursor_col_num() - text_len - 1
    line_num = util.get_cursor_line_num()
    line = util.get_line(line_num)[:chain_start]
    line = "{}{}()".format(line, method_name)

    method_args = None
    tokens = script.get_token_chain(line, line_num, len(line))
    if tokens and type(tokens[-1]) is script.MethodToken:
        method_args = tokens[-1].args
    else:
        return

    hl_identifier = vim.eval("g:echodoc#highlight_identifier")
    hl_arguments = vim.eval("g:echodoc#highlight_arguments")
    arg_hl_index = 0
    paren_count = 0
    for char in text[len(m.group(0))+1:]:
        if char == "(":
            paren_count += 1
        elif char == ")":
            paren_count -= 1
        elif char == "," and paren_count <= 0:
            arg_hl_index += 1

    echodoc = [
        { "text": method_name, "highlight": hl_identifier },
        { "text": "(" }
    ]

    arg_count = len(method_args)
    for (i, arg) in enumerate(method_args):
        if arg.type:
            echodoc.append({"text": "{} ".format(arg.type), "highlight": "gdClass"})
        d = { "text": arg.name }
        if arg_hl_index == i:
            d["highlight"] = hl_arguments
        echodoc.append(d)
        if arg_count - 1 > i:
            echodoc.append({"text": ", "})
    if tokens[-1].qualifiers and "vararg" in tokens[-1].qualifiers:
        if arg_count > 0:
            echodoc.append({"text": ", "})
        d = { "text": "..." }
        if arg_hl_index >= arg_count:
            d["highlight"] = hl_arguments
        echodoc.append(d)
    echodoc.append({"text": ")"})

    vim.command("let echodoc_search_result = {}".format(str(echodoc)))
