#!/usr/bin/python3
"""Defines a module for a Square shape with size."""


class Square:
    """Represent a square with a specific size."""

    def __init__(self, size):
        """Initialize a new Square.

        Args:
            size (int): The size of the new square.
        """
        self.__size = size
