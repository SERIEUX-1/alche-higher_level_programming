#!/usr/bin/python3
"""Module that defines a custom list class MyList."""


class MyList(list):
    """A class that inherits from standard list."""

    def print_sorted(self):
        """Prints the list elements sorted in ascending order."""
        print(sorted(self))
