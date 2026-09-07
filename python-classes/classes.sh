#!/bin/bash

# Task 0: My first square
cat << 'EOF' > 0-square.py
#!/usr/bin/python3
"""Defines a module for a Square shape."""


class Square:
    """Represent an empty square."""
    pass
EOF

# Task 1: Square with size
cat << 'EOF' > 1-square.py
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
EOF

# Task 2: Size validation
cat << 'EOF' > 2-square.py
#!/usr/bin/python3
"""Defines a module for a Square shape with size validation."""


class Square:
    """Represent a square with validated size."""

    def __init__(self, size=0):
        """Initialize a new Square.

        Args:
            size (int): The size of the new square. Defaults to 0.

        Raises:
            TypeError: If size is not an integer.
            ValueError: If size is less than 0.
        """
        if not isinstance(size, int):
            raise TypeError("size must be an integer")
        if size < 0:
            raise ValueError("size must be >= 0")
        self.__size = size
EOF

# Task 3: Area of a square
cat << 'EOF' > 3-square.py
#!/usr/bin/python3
"""Defines a module for a Square shape with area calculation."""


class Square:
    """Represent a square with size validation and area computation."""

    def __init__(self, size=0):
        """Initialize a new Square.

        Args:
            size (int): The size of the new square. Defaults to 0.

        Raises:
            TypeError: If size is not an integer.
            ValueError: If size is less than 0.
        """
        if not isinstance(size, int):
            raise TypeError("size must be an integer")
        if size < 0:
            raise ValueError("size must be >= 0")
        self.__size = size

    def area(self):
        """Calculate and return the current square area.

        Returns:
            int: The area of the square.
        """
        return self.__size ** 2
EOF

# Task 4: Access and update private attribute
cat << 'EOF' > 4-square.py
#!/usr/bin/python3
"""Defines a module for a Square shape with property getter/setter."""


class Square:
    """Represent a square with full encapsulation using properties."""

    def __init__(self, size=0):
        """Initialize a new Square.

        Args:
            size (int): The size of the new square. Defaults to 0.
        """
        self.size = size

    @property
    def size(self):
        """Get or set the current size of the square."""
        return self.__size

    @size.setter
    def size(self, value):
        if not isinstance(value, int):
            raise TypeError("size must be an integer")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    def area(self):
        """Calculate and return the current square area.

        Returns:
            int: The area of the square.
        """
        return self.__size ** 2
EOF

# Task 5: Printing a square
cat << 'EOF' > 5-square.py
#!/usr/bin/python3
"""Defines a module for a Square shape with a print method."""


class Square:
    """Represent a square that can be printed using '#'."""

    def __init__(self, size=0):
        """Initialize a new Square.

        Args:
            size (int): The size of the new square. Defaults to 0.
        """
        self.size = size

    @property
    def size(self):
        """Get or set the current size of the square."""
        return self.__size

    @size.setter
    def size(self, value):
        if not isinstance(value, int):
            raise TypeError("size must be an integer")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    def area(self):
        """Calculate and return the current square area.

        Returns:
            int: The area of the square.
        """
        return self.__size ** 2

    def my_print(self):
        """Print the square with the '#' character to stdout."""
        if self.__size == 0:
            print()
            return

        for _ in range(self.__size):
            print("#" * self.__size)
EOF

# Task 6: Coordinates of a square
cat << 'EOF' > 6-square.py
#!/usr/bin/python3
"""Defines a module for a Square shape with size and position."""


class Square:
    """Represent a square with size and coordinate position attributes."""

    def __init__(self, size=0, position=(0, 0)):
        """Initialize a new Square.

        Args:
            size (int): The size of the new square. Defaults to 0.
            position (tuple): The (x, y) coordinates. Defaults to (0, 0).
        """
        self.size = size
        self.position = position

    @property
    def size(self):
        """Get or set the current size of the square."""
        return self.__size

    @size.setter
    def size(self, value):
        if not isinstance(value, int):
            raise TypeError("size must be an integer")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    @property
    def position(self):
        """Get or set the position tuple of the square."""
        return self.__position

    @position.setter
    def position(self, value):
        if (not isinstance(value, tuple) or
                len(value) != 2 or
                not all(isinstance(i, int) for i in value) or
                not all(i >= 0 for i in value)):
            raise TypeError("position must be a tuple of 2 positive integers")
        self.__position = value

    def area(self):
        """Calculate and return the current square area.

        Returns:
            int: The area of the square.
        """
        return self.__size ** 2

    def my_print(self):
        """Print the square with '#' using offset from position."""
        if self.__size == 0:
            print()
            return

        for _ in range(self.__position[1]):
            print()
        for _ in range(self.__size):
            print(" " * self.__position[0] + "#" * self.__size)
EOF

# Create mandatory README.md
cat << 'EOF' > README.md
# Python - Classes and Objects

This project covers basic Object-Oriented Programming (OOP) concepts in Python, including class creation, instance attributes, private attributes, property getters/setters, methods, and validation.

## Files
* `0-square.py`: Defines an empty class `Square`.
* `1-square.py`: Defines a `Square` class with a private `size` attribute.
* `2-square.py`: Adds type and value validation for `size`.
* `3-square.py`: Adds a public `area` method to calculate square area.
* `4-square.py`: Implements getter and setter properties for `size`.
* `5-square.py`: Implements a `my_print` method to print the square using `#`.
* `6-square.py`: Adds `position` attribute and updates `my_print` for coordinate offsets.
EOF

# Make all Python script files executable
chmod +x *.py

echo "All task files and README.md generated with executable permissions!"
