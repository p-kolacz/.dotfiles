# Stores built-in class info

from collections import namedtuple
import vim
import json

BUILT_IN = 1
EXTENDABLE = 2
EXPORTABLE = 3

_classes = {}
_class_info = None
_class_names = None

_global_scope = None

_JSON_DIR = vim.eval("expand('<sfile>:p:h')") + "/../python/json/"

GodotMember = namedtuple("GodotMember", "name, type")
GodotConstant = namedtuple("GodotConstant", "name, value, type")
GodotMethod = namedtuple("GodotMethod", "name, returns, args, qualifiers")
GodotMethodArg = namedtuple("GodotMethodArg", "name, type, default")

class GodotClass:
    def __init__(self, name, inherits, built_in, members, constants, methods):
        self._name = name
        self._inherits = inherits
        self._built_in = built_in
        self._members = members
        self._constants = constants
        self._methods = methods

        self._members_lookup = {}
        for member in members:
            self._members_lookup[member.name] = member

        self._constants_lookup = {}
        for constant in constants:
            self._constants_lookup[constant.name] = constant

        self._methods_lookup = {}
        for method in methods:
            self._methods_lookup[method.name] = method

    def get_name(self):
        return self._name

    def get_inherited_class(self):
        return self._inherits

    def is_built_in(self):
        return self._built_in

    def get_member(self, name, search_inherited=True, search_global=False):
        member = self._members_lookup.get(name)
        if not member and search_inherited and self._inherits:
            member = self._inherits.get_member(name)
        if not member and search_global:
            member = get_global_scope().get_member(name)
        return member

    def get_constant(self, name, search_inherited=True, search_global=False):
        constant = self._constants_lookup.get(name)
        if not constant and search_inherited and self._inherits:
            constant = self._inherits.get_constant(name)
        if not constant and search_global:
            constant = get_global_scope().get_constant(name)
        return constant

    def get_method(self, name, search_inherited=True, search_global=False):
        method = self._methods_lookup.get(name)
        if not method and search_inherited and self._inherits:
            method = self._inherits.get_method(name)
        if not method and search_global:
            method = get_global_scope().get_method(name)
        return method

    def iter_members(self):
        return iter(self._members)

    def iter_constants(self):
        return iter(self._constants)

    def iter_methods(self):
        return iter(self._methods)

def _load_class_info():
    global _class_info
    global _class_names
    if not _class_info:
        _class_info = json.load(open(_JSON_DIR + "@ClassInfo.json", "r"))
        _class_names = set(map(lambda c: c["name"], _class_info))

def _load_class(name):
    path = "{}{}.json".format(_JSON_DIR, name)
    try:
        obj = json.load(open(path, "r"))
    except:
        return

    c_name = obj.get("name")
    inherits = obj.get("inherits")
    built_in = obj.get("built_in")

    def map_member(m):
        return GodotMember(m["name"], m["type"])
    def map_constant(c):
        return GodotConstant(c["name"], c["value"], c.get("type"))
    def map_arg(a):
        return GodotMethodArg(a["name"], a["type"], a.get("default"))
    def map_method(m):
        args = list(map(map_arg, m.get("args", [])))
        return GodotMethod(m["name"], m["returns"], args, m.get("qualifiers"))

    members = list(map(map_member, obj.get("members", [])))
    constants = list(map(map_constant, obj.get("constants", [])))
    methods = list(map(map_method, obj.get("methods", [])))
    return GodotClass(c_name, get_class(inherits), built_in, members, constants, methods)

def get_class(name):
    if not name:
        return
    c = _classes.get(name)
    if not c:
        _load_class_info()
        # Only attempt to load known classes.
        if not name in _class_names:
            return
        c = _load_class(name)
        _classes[name] = c
    return c

def get_global_scope():
    global _global_scope
    if not _global_scope:
        _global_scope = _load_class("@GlobalScope")
    return _global_scope

def iter_class_names(type=0):
    _load_class_info()
    def filter_fun(c):
        return (type == 0 or
                type == BUILT_IN and c.get("built_in") or
                type == EXTENDABLE and not c.get("built_in") or
                type == EXPORTABLE and c.get("exportable"))
    return map(lambda c: c["name"], filter(filter_fun, _class_info))




