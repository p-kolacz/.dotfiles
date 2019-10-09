# This is a standalone script that converts the Godot class docs into JSON format.
# There are several reasons for doing this:
# 1. Parsing is much faster (about 4x on my machine). This is partly due to
#    the removal of unneccessary data when converting.
# 2. Extra information can be gathered at "compile time", as it were. For example,
#    it's useful to know which types are exportable via the 'export' keyword,
#    but gathering these types on demand can add an annoying pause when
#    invoking completion for the first time in a newly opened file.
#    Instead, we can just generate another JSON file that contains this information.
#
# When running this script, pass the directory path containing the XML docs.
# Passing the wrong directory shouldn't cause any damage, but you should
# really double-check the path anyway just in case.
#
# This script only needs to be run when new Godot types are added.
# The resulting JSON files are checked into version control for simplicity's sake.

import os
import sys
import json
import xml.etree.cElementTree as ET

if len(sys.argv) != 2:
    print("Usage: python gen_json.py [path/to/docs]")
    exit()

DOCS_DIR = sys.argv[1]
if not DOCS_DIR.endswith("/"):
    DOCS_DIR += "/"

if not os.path.isdir(DOCS_DIR):
    print("'{}' is not a valid directory".format(DOCS_DIR))
    exit()

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__)) + "/"
JSON_DIR = SCRIPT_DIR + "json/"

classes = []
class_info = []
constructors = []

def dump(obj, path):
    out = open(JSON_DIR + path, "w")
    json.dump(obj, out, indent=2, separators=(",", ":"))

def get_class_info(c):
    for info in class_info:
        if info["name"] == c["name"]:
            return info

def xml_to_json(path):
    c = {"members": [], "constants": [], "methods": []}
    info = {}
    current_method = None
    for event, elem in ET.iterparse(path, events=("start", "end")):
        attrib = elem.attrib
        tag = elem.tag
        if event == "start":
            if tag == "class":
                c["name"] = attrib["name"]
                c["inherits"] = attrib.get("inherits")
                info["name"] = attrib["name"]
                if attrib.get("category") == "Built-In Types":
                    c["built_in"] = True
                    info["built_in"] = True
            elif tag == "member":
                member = {}
                member["name"] = attrib["name"]
                member["type"] = attrib.get("enum", attrib["type"])
                c["members"].append(member)
            elif tag == "constant":
                constant = {}
                constant["name"] = attrib["name"]
                constant["value"] = attrib["value"]
                if "enum" in attrib:
                    constant["type"] = attrib["enum"]
                c["constants"].append(constant)
            elif tag == "method":
                method = {"returns": "void"}
                method["name"] = attrib["name"]
                if "qualifiers" in attrib:
                    method["qualifiers"] = attrib["qualifiers"]
                if method["name"] == c["name"]:
                    constructors.append(method)
                else:
                    c["methods"].append(method)
                current_method = method
            elif tag == "argument":
                if not current_method:
                    continue
                arg = {}
                arg["name"] = attrib["name"]
                arg["type"] = attrib["type"]
                if "default" in attrib:
                    arg["default"] = attrib["default"]
                if not "args" in current_method:
                    current_method["args"] = []
                current_method["args"].append(arg)
            elif tag == "return":
                if not current_method:
                    continue
                current_method["returns"] = attrib.get("type", "void")
        elif event == "end" and tag == "method":
            current_method = None
    return (c, info)

# Built-in types and types inherited from Resource are exportable.
def is_exportable(c):
    if c["name"] == "Resource" or get_class_info(c).get("built_in"):
        return True
    else:
        if "inherits" in c:
            inherited = [c2 for c2 in classes if c2["name"] == c["inherits"]]
            if inherited:
                return is_exportable(inherited[0])
    return False

# Clear json directory
for f in os.listdir(JSON_DIR):
    os.remove(JSON_DIR + f)

# Gather classes.
for f in os.listdir(DOCS_DIR):
    if f.endswith(".xml") and not f.startswith("@"):
        path = DOCS_DIR + f
        (c, info) = xml_to_json(path)
        classes.append(c)
        class_info.append(info)

classes.sort(key=lambda c: c["name"])
class_info.sort(key=lambda c: c["name"])

# Combine global scope items into a single "class".
global_scope = xml_to_json(DOCS_DIR + "@GlobalScope.xml")[0]
gdscript = xml_to_json(DOCS_DIR + "@GDScript.xml")[0]
global_scope["members"].extend(gdscript["members"])
global_scope["constants"].extend(gdscript["constants"])
global_scope["methods"].extend(gdscript["methods"])
global_scope["methods"].extend(constructors)
global_scope["methods"].sort(key=lambda m: m["name"])
global_scope["name"] = None

# Gather extra class info
for c in classes:
    if is_exportable(c):
        get_class_info(c)["exportable"] = True

# Write JSON to files
dump(global_scope, "@GlobalScope.json")
dump(class_info, "@ClassInfo.json")
for c in classes:
    out = open(JSON_DIR + c["name"] + ".json", "w")
    dump(c, c["name"] + ".json")

