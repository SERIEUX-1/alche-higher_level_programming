#!/usr/bin/python3
"""Prints, in alpha order, all names in hidden_4.pyc not starting with __"""

if __name__ == "__main__":
    import hidden_4
    names = sorted(n for n in dir(hidden_4) if not n.startswith("__"))
    for name in names:
        print(name)
