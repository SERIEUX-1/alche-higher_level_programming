#!/bin/bash

# Create tests directory
mkdir -p tests

# 1. README.md
cat << 'EOF' > README.md
# Python - Input/Output

This project covers file handling, reading and writing files, working with JSON serialization and deserialization, dynamic attribute retrieval, and working with Python data structures.
EOF

# 2. 0-read_file.py
cat << 'EOF' > 0-read_file.py
#!/usr/bin/python3
"""Module that contains a function that reads a text file and prints it."""


def read_file(filename=""):
    """Reads a text file (UTF8) and prints its content to stdout."""
    with open(filename, encoding="utf-8") as f:
        print(f.read(), end="")
EOF

# 3. 1-write_file.py
cat << 'EOF' > 1-write_file.py
#!/usr/bin/python3
"""Module that contains a function that writes a string to a text file."""


def write_file(filename="", text=""):
    """Writes a string to a text file (UTF8) and returns character count."""
    with open(filename, "w", encoding="utf-8") as f:
        return f.write(text)
EOF

# 4. 2-append_write.py
cat << 'EOF' > 2-append_write.py
#!/usr/bin/python3
"""Module that contains a function that appends a string to a file."""


def append_write(filename="", text=""):
    """Appends a string to a text file (UTF8) and returns characters added."""
    with open(filename, "a", encoding="utf-8") as f:
        return f.write(text)
EOF

# 5. 3-to_json_string.py
cat << 'EOF' > 3-to_json_string.py
#!/usr/bin/python3
"""Module that provides JSON serialization functionality."""
import json


def to_json_string(my_obj):
    """Returns the JSON representation of an object as a string."""
    return json.dumps(my_obj)
EOF

# 6. 4-from_json_string.py
cat << 'EOF' > 4-from_json_string.py
#!/usr/bin/python3
"""Module that provides JSON deserialization functionality."""
import json


def from_json_string(my_str):
    """Returns an object represented by a JSON string."""
    return json.loads(my_str)
EOF

# 7. 5-save_to_json_file.py
cat << 'EOF' > 5-save_to_json_file.py
#!/usr/bin/python3
"""Module that writes an object to a file using JSON representation."""
import json


def save_to_json_file(my_obj, filename):
    """Writes an Object to a text file, using a JSON representation."""
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(my_obj, f)
EOF

# 8. 6-load_from_json_file.py
cat << 'EOF' > 6-load_from_json_file.py
#!/usr/bin/python3
"""Module that creates an object from a JSON file."""
import json


def load_from_json_file(filename):
    """Creates an Object from a JSON file."""
    with open(filename, encoding="utf-8") as f:
        return json.load(f)
EOF

# 9. 7-add_item.py
cat << 'EOF' > 7-add_item.py
#!/usr/bin/python3
"""Script that adds all command-line arguments to a list and saves to JSON file."""
import sys

save_to_json_file = __import__('5-save_to_json_file').save_to_json_file
load_from_json_file = __import__('6-load_from_json_file').load_from_json_file

filename = "add_item.json"

try:
    items = load_from_json_file(filename)
except FileNotFoundError:
    items = []

items.extend(sys.argv[1:])
save_to_json_file(items, filename)
EOF

# 10. 8-class_to_json.py
cat << 'EOF' > 8-class_to_json.py
#!/usr/bin/python3
"""Module that returns dictionary description for JSON serialization."""


def class_to_json(obj):
    """Returns the dictionary description for JSON serialization of an object."""
    return obj.__dict__
EOF

# 11. 9-student.py
cat << 'EOF' > 9-student.py
#!/usr/bin/python3
"""Module that defines a Student class."""


class Student:
    """Class representing a student."""

    def __init__(self, first_name, last_name, age):
        """Initializes a new Student instance."""
        self.first_name = first_name
        self.last_name = last_name
        self.age = age

    def to_json(self):
        """Retrieves a dictionary representation of a Student instance."""
        return self.__dict__
EOF

# 12. 10-student.py
cat << 'EOF' > 10-student.py
#!/usr/bin/python3
"""Module that defines a Student class with attribute filtering."""


class Student:
    """Class representing a student."""

    def __init__(self, first_name, last_name, age):
        """Initializes a new Student instance."""
        self.first_name = first_name
        self.last_name = last_name
        self.age = age

    def to_json(self, attrs=None):
        """Retrieves a dictionary representation of a Student instance.

        If attrs is a list of strings, only attributes contained in this list
        are retrieved.
        """
        if isinstance(attrs, list) and all(isinstance(x, str) for x in attrs):
            res = {}
            for k in attrs:
                if k in self.__dict__:
                    res[k] = self.__dict__[k]
            return res
        return self.__dict__
EOF

# 13. 11-student.py
cat << 'EOF' > 11-student.py
#!/usr/bin/python3
"""Module that defines a Student class with reload capabilities."""


class Student:
    """Class representing a student."""

    def __init__(self, first_name, last_name, age):
        """Initializes a new Student instance."""
        self.first_name = first_name
        self.last_name = last_name
        self.age = age

    def to_json(self, attrs=None):
        """Retrieves a dictionary representation of a Student instance."""
        if isinstance(attrs, list) and all(isinstance(x, str) for x in attrs):
            res = {}
            for k in attrs:
                if k in self.__dict__:
                    res[k] = self.__dict__[k]
            return res
        return self.__dict__

    def reload_from_json(self, json):
        """Replaces all attributes of the Student instance from a dictionary."""
        for key, value in json.items():
            setattr(self, key, value)
EOF

# 14. 12-pascal_triangle.py
cat << 'EOF' > 12-pascal_triangle.py
#!/usr/bin/python3
"""Module that computes Pascal's triangle."""


def pascal_triangle(n):
    """Returns a list of lists of integers representing Pascal's triangle of n."""
    if n <= 0:
        return []

    triangle = [[1]]
    for i in range(1, n):
        prev_row = triangle[-1]
        row = [1]
        for j in range(len(prev_row) - 1):
            row.append(prev_row[j] + prev_row[j + 1])
        row.append(1)
        triangle.append(row)

    return triangle
EOF

# Make all python files executable
chmod +x 0-read_file.py 1-write_file.py 2-append_write.py \
         3-to_json_string.py 4-from_json_string.py 5-save_to_json_file.py \
         6-load_from_json_file.py 7-add_item.py 8-class_to_json.py \
         9-student.py 10-student.py 11-student.py 12-pascal_triangle.py

echo "All files for python-input_output have been generated successfully."
