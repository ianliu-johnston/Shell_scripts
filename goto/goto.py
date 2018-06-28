"""
" goto.py - A short script to get and save shortcuts to directories
"     This script requires a bash function wrapper because the python
"     subshell will not change directories for you.
"     Does not have any dependencies, and uses only standard Python Library
"
"     include the following function in your ~/.bashrc:
"
" goto(){ DIR=$(python3 ~/bin/goto.py $@); [[ ! -z "$DIR" ]] && cd "$DIR" }
" export -f goto
"
"     If you don't use bash, translate the function into your appropriate shell
"""
import json
import os
from sys import argv,stderr


dotfile = os.path.expanduser('~/.goto-locations')
RED = '\033[31m'
CYAN = '\033[36m'
GREEN = '\033[32m'
CLEAR = '\033[0m'


def load_shortcuts():
    try:
        with open(dotfile, 'r') as f:
            return json.load(f)
    except:
        example = {'tmp': "/tmp"}
        with open(dotfile, 'w+') as f:
            json.dump(example, f)
        return example

def format_shortcuts(sc):
    return "\n".join(["{green}{key}: {cyan}{value}{clear}".format(
        green=GREEN, cyan=CYAN, clear=CLEAR,
        key=s, value=sc[s]) for s in sorted(sc.keys())])


def sanitize(needles, haystack):
    return any([True if char in needles else False for char in haystack])


def get_help(shortcuts):
    print("""Usage:{red}
    goto <alias name>
    goto add <alias name> <path|--here|--last>
    goto update <alias name> <path|--here|--last>
    goto rm <alias name>
    goto ls {{alias name}}
    goto help{clear}
Current Variables:
{keys}""".format(
        red=RED, clear=CLEAR,
        keys=format_shortcuts(shortcuts)
       ), file=stderr)


def normalize_path(path):
    if path == "--here":
        path = os.getcwd()
    elif path == "--last":
        path = os.environ.get('OLDPWD')
    path = os.path.expanduser(path)
    if os.path.exists(path) is False:
        print("ERROR: {red}{path} does not exist{clear}".format(red=RED, path=path, clear=CLEAR), file=stderr)
        exit(1)
    return path


def goto_add(shortcuts, alias, path):
    illegal_chars = '!@#$%^&*(){}|[]\\;\':"<>?`,\r\n'
    if sanitize(alias, illegal_chars):
        print("ERROR: {red}Illegal character detected{clear}".format(red=RED, clear=CLEAR), file=stderr)
        exit(1)
    path = normalize_path(path)
    shortcuts.update({alias: path})
    with open(dotfile, 'w+') as f:
        json.dump(shortcuts, f)
    return (alias, path)

def goto_rm(shortcuts, alias):
    rtn = shortcuts.pop(alias, "nothing")
    with open(dotfile, 'w+') as f:
        json.dump(shortcuts, f)
    return rtn

def goto_ls(shortcuts, alias=None):
    if alias is None:
        return format_shortcuts(shortcuts)
    if alias in shortcuts:
        return shortcuts[alias]
    return "{red}{alias} Not Found{clear}".format(red=RED, alias=alias, clear=CLEAR)

def getargs(shortcuts):
    argv.pop(0)
    commands = ['help', 'add', 'update', 'rm', 'ls']
    short = argv[0] if len(argv) > 0 else None
    if short in commands[1:2] and len(argv) is 3:
        key = goto_add(shortcuts, argv[1], argv[2])
        print(format_shortcuts(shortcuts), file=stderr)
    elif short == commands[3] and len(argv) is 2:
        key = goto_rm(shortcuts, argv[1])
        print("Deleted {red}{key}{clear}".format(red=RED, clear=CLEAR, key=key), file=stderr)
    elif short == commands[4]:
        try:
            print(goto_ls(shortcuts, argv[1]), file=stderr)
        except:
            print(goto_ls(shortcuts), file=stderr)
    elif short not in commands and len(argv) is 1:
        if short in shortcuts.keys():
            print(shortcuts[short])
        else:
            print("{red}{alias} Not Found{clear}".format(red=RED, alias=short, clear=CLEAR), file=stderr)
    else:
        get_help(shortcuts)


if __name__ == "__main__":
    shortcuts = load_shortcuts()
    getargs(shortcuts)
