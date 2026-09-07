#!/bin/bash

# Create tests directory
mkdir -p tests

# 1. README.md
cat << 'EOF' > README.md
# Python - Inheritance

This repository contains implementations exploring Python inheritance, class hierarchies, method overriding, and dynamic type/attribute inspection.
EOF

# 2. 0-lookup.py
cat << 'EOF' > 0-lookup.py
#!/usr/bin/python3
"""Module that provides a function to list available attributes and methods."""


def lookup(obj):
    """Returns the list of available attributes and methods of an object."""
    return dir(obj)
EOF

# 3. 1-my_list.py
cat << 'EOF' > 1-my_list.py
#!/usr/bin/python3
"""Module that defines a custom list class MyList."""


class MyList(list):
    """A class that inherits from standard list."""

    def print_sorted(self):
        """Prints the list elements sorted in ascending order."""
        print(sorted(self))
EOF

# 4. tests/1-my_list.txt
cat << 'EOF' > tests/1-my_list.txt
The ``1-my_list`` module
========================

Using ``MyList``
----------------

Importing the class:
    >>> MyList = __import__('1-my_list').MyList

Testing instantiation:
    >>> my_list = MyList()
    >>> isinstance(my_list, list)
    True
    >>> print(my_list)
    []

Testing print_sorted with positive integers:
    >>> my_list.append(1)
    >>> my_list.append(4)
    >>> my_list.append(2)
    >>> my_list.append(3)
    >>> my_list.append(5)
    >>> print(my_list)
    [1, 4, 2, 3, 5]
    >>> my_list.print_sorted()
    [1, 2, 3, 4, 5]
    >>> print(my_list)
    [1, 4, 2, 3, 5]

Testing with negative integers:
    >>> my_list2 = MyList([3, -1, 0, -10, 5])
    >>> my_list2.print_sorted()
    [-10, -1, 0, 3, 5]

Testing with empty list:
    >>> my_list3 = MyList()
    >>> my_list3.print_sorted()
    []
EOF

# 5. 2-is_same_class.py
cat << 'EOF' > 2-is_same_class.py
#!/usr/bin/python3
"""Module that checks if an object is exactly an instance of a class."""


def is_same_class(obj, a_class):
    """Returns True if obj is exactly an instance of a_class; else False."""
    return type(obj) is a_class
EOF

# 6. 3-is_kind_of_class.py
cat << 'EOF' > 3-is_kind_of_class.py
#!/usr/bin/python3
"""Module that checks if an object is an instance or inherited instance."""


def is_kind_of_class(obj, a_class):
    """Returns True if obj is an instance or sub-instance of a_class."""
    return isinstance(obj, a_class)
EOF

# 7. 4-inherits_from.py
cat << 'EOF' > 4-inherits_from.py
#!/usr/bin/python3
"""Module that checks if an object inherits (subclass only) from a class."""


def inherits_from(obj, a_class):
    """Returns True if obj is an instance of a subclass of a_class."""
    return type(obj) is not a_class and isinstance(obj, a_class)
EOF

# 8. 5-base_geometry.py
cat << 'EOF' > 5-base_geometry.py
#!/usr/bin/python3
"""Module that defines an empty geometry class."""


class BaseGeometry:
    """An empty class representing BaseGeometry."""
    pass
EOF

# 9. 6-base_geometry.py
cat << 'EOF' > 6-base_geometry.py
#!/usr/bin/python3
"""Module that defines a BaseGeometry class with an area stub."""


class BaseGeometry:
    """Class representing BaseGeometry."""

    def area(self):
        """Raises an Exception indicating area is not implemented."""
        raise Exception("area() is not implemented")
EOF

# 10. 7-base_geometry.py
cat << 'EOF' > 7-base_geometry.py
#!/usr/bin/python3
"""Module that defines BaseGeometry with integer validation."""


class BaseGeometry:
    """Class representing BaseGeometry."""

    def area(self):
        """Raises an Exception indicating area is not implemented."""
        raise Exception("area() is not implemented")

    def integer_validator(self, name, value):
        """Validates that value is an integer strictly greater than 0."""
        if type(value) is not int:
            raise TypeError("{} must be an integer".format(name))
        if value <= 0:
            raise ValueError("{} must be greater than 0".format(name))
EOF

# 11. tests/7-base_geometry.txt
cat << 'EOF' > tests/7-base_geometry.txt
The ``7-base_geometry`` module
==============================

Using ``BaseGeometry``
----------------------

Importing the class:
    >>> BaseGeometry = __import__('7-base_geometry').BaseGeometry
    >>> bg = BaseGeometry()

Testing integer_validator with valid values:
    >>> bg.integer_validator("my_int", 12)
    >>> bg.integer_validator("width", 89)

Testing integer_validator with non-integers:
    >>> bg.integer_validator("name", "John")
    Traceback (most recent call last):
    ...
    TypeError: name must be an integer

    >>> bg.integer_validator("bool_val", True)
    Traceback (most recent call last):
    ...
    TypeError: bool_val must be an integer

    >>> bg.integer_validator("float_val", 3.14)
    Traceback (most recent call last):
    ...
    TypeError: float_val must be an integer

    >>> bg.integer_validator("list_val", [1, 2])
    Traceback (most recent call last):
    ...
    TypeError: list_val must be an integer

Testing integer_validator with invalid numbers (<= 0):
    >>> bg.integer_validator("age", 0)
    Traceback (most recent call last):
    ...
    ValueError: age must be greater than 0

    >>> bg.integer_validator("distance", -4)
    Traceback (most recent call last):
    ...
    ValueError: distance must be greater than 0

Testing area method:
    >>> bg.area()
    Traceback (most recent call last):
    ...
    Exception: area() is not implemented
EOF

# 12. 8-rectangle.py
cat << 'EOF' > 8-rectangle.py
#!/usr/bin/python3
"""Module that defines a Rectangle inheriting from BaseGeometry."""
BaseGeometry = __import__('7-base_geometry').BaseGeometry


class Rectangle(BaseGeometry):
    """Rectangle shape class."""

    def __init__(self, width, height):
        """Initializes a new Rectangle with width and height."""
        self.integer_validator("width", width)
        self.__width = width
        self.integer_validator("height", height)
        self.__height = height
EOF

# 13. 9-rectangle.py
cat << 'EOF' > 9-rectangle.py
#!/usr/bin/python3
"""Module that defines a full Rectangle inheriting from BaseGeometry."""
BaseGeometry = __import__('7-base_geometry').BaseGeometry


class Rectangle(BaseGeometry):
    """Rectangle shape class."""

    def __init__(self, width, height):
        """Initializes a new Rectangle with width and height."""
        self.integer_validator("width", width)
        self.__width = width
        self.integer_validator("height", height)
        self.__height = height

    def area(self):
        """Returns the area of the rectangle."""
        return self.__width * self.__height

    def __str__(self):
        """Returns a string representation of the rectangle."""
        return "[Rectangle] {}/{}".format(self.__width, self.__height)
EOF

# 14. 10-square.py
cat << 'EOF' > 10-square.py
#!/usr/bin/python3
"""Module that defines a Square inheriting from Rectangle."""
Rectangle = __import__('9-rectangle').Rectangle


class Square(Rectangle):
    """Square shape class inheriting from Rectangle."""

    def __init__(self, size):
        """Initializes a new Square with size."""
        self.integer_validator("size", size)
        super().__init__(size, size)
        self.__size = size

    def area(self):
        """Returns the area of the square."""
        return self.__size ** 2
EOF

# 15. 11-square.py
cat << 'EOF' > 11-square.py
#!/usr/bin/python3
"""Module that defines a Square with custom string representation."""
Rectangle = __import__('9-rectangle').Rectangle


class Square(Rectangle):
    """Square shape class inheriting from Rectangle."""

    def __init__(self, size):
        """Initializes a new Square with size."""
        self.integer_validator("size", size)
        super().__init__(size, size)
        self.__size = size

    def area(self):
        """Returns the area of the square."""
        return self.__size ** 2

    def __str__(self):
        """Returns a string representation of the square."""
        return "[Square] {}/{}".format(self.__size, self.__size)
EOF

# Make all python scripts executable
chmod +x 0-lookup.py 1-my_list.py 2-is_same_class.py 3-is_kind_of_class.py \
         4-inherits_from.py 5-base_geometry.py 6-base_geometry.py \
         7-base_geometry.py 8-rectangle.py 9-rectangle.py \
         10-square.py 11-square.py

echo "All files for python-inheritance have been generated successfully."
