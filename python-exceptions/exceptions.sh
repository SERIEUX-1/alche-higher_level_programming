#!/bin/bash

# 0. Safe list printing
cat << 'EOF' > 0-safe_print_list.py
#!/usr/bin/python3
def safe_print_list(my_list=[], x=0):
    count = 0
    for i in range(x):
        try:
            print("{}".format(my_list[i]), end="")
            count += 1
        except IndexError:
            break
    print()
    return count
EOF

# 1. Safe printing of an integers list
cat << 'EOF' > 1-safe_print_integer.py
#!/usr/bin/python3
def safe_print_integer(value):
    try:
        print("{:d}".format(value))
        return True
    except (ValueError, TypeError):
        return False
EOF

# 2. Print and count integers
cat << 'EOF' > 2-safe_print_list_integers.py
#!/usr/bin/python3
def safe_print_list_integers(my_list=[], x=0):
    count = 0
    for i in range(x):
        try:
            print("{:d}".format(my_list[i]), end="")
            count += 1
        except (ValueError, TypeError):
            continue
    print()
    return count
EOF

# 3. Integers division with debug
cat << 'EOF' > 3-safe_print_division.py
#!/usr/bin/python3
def safe_print_division(a, b):
    result = None
    try:
        result = a / b
    except (ZeroDivisionError, TypeError):
        pass
    finally:
        print("Inside result: {}".format(result))
    return result
EOF

# 4. Divide a list
cat << 'EOF' > 4-list_division.py
#!/usr/bin/python3
def list_division(my_list_1, my_list_2, list_length):
    new_list = []
    for i in range(list_length):
        div = 0
        try:
            div = my_list_1[i] / my_list_2[i]
        except TypeError:
            print("wrong type")
        except ZeroDivisionError:
            print("division by 0")
        except IndexError:
            print("out of range")
        finally:
            new_list.append(div)
    return new_list
EOF

# 5. Raise exception
cat << 'EOF' > 5-raise_exception.py
#!/usr/bin/python3
def raise_exception():
    raise TypeError
EOF

# 6. Raise a message
cat << 'EOF' > 6-raise_exception_msg.py
#!/usr/bin/python3
def raise_exception_msg(message=""):
    raise NameError(message)
EOF

# README.md
cat << 'EOF' > README.md
# Python - Exceptions

This project covers exception handling in Python using `try`, `except`, `finally`, and raising custom exceptions.

## Files
* `0-safe_print_list.py`: Function that prints `x` elements of a list.
* `1-safe_print_integer.py`: Function that prints an integer with `"{:d}".format()`.
* `2-safe_print_list_integers.py`: Function that prints the first `x` elements of a list and only integers.
* `3-safe_print_division.py`: Function that divides 2 integers and prints the result inside `finally`.
* `4-list_division.py`: Function that divides element by element 2 lists.
* `5-raise_exception.py`: Function that raises a type exception.
* `6-raise_exception_msg.py`: Function that raises a name exception with a message.
EOF

# Make all Python scripts executable
chmod +x *.py

echo "All files created successfully and marked as executable!"
