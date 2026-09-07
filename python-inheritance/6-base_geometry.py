#!/usr/bin/python3
"""Module that defines a BaseGeometry class with an area stub."""


class BaseGeometry:
    """Class representing BaseGeometry."""

    def area(self):
        """Raises an Exception indicating area is not implemented."""
        raise Exception("area() is not implemented")
