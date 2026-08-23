#!/bin/bash
# Run this from inside python-data_structures/ directory of your repo

cat > 0-print_list_integer.py << 'EOF'
#!/usr/bin/python3
def print_list_integer(my_list=[]):
    for i in my_list:
        print("{:d}".format(i))
EOF

cat > 1-element_at.py << 'EOF'
#!/usr/bin/python3
def element_at(my_list, idx):
    if idx < 0:
        return None
    if idx > len(my_list) - 1:
        return None
    return my_list[idx]
EOF

cat > 2-replace_in_list.py << 'EOF'
#!/usr/bin/python3
def replace_in_list(my_list, idx, element):
    if idx < 0 or idx > len(my_list) - 1:
        return my_list
    my_list[idx] = element
    return my_list
EOF

cat > 3-print_reversed_list_integer.py << 'EOF'
#!/usr/bin/python3
def print_reversed_list_integer(my_list=[]):
    for i in my_list[::-1]:
        print("{:d}".format(i))
EOF

cat > 4-new_in_list.py << 'EOF'
#!/usr/bin/python3
def new_in_list(my_list, idx, element):
    if idx < 0 or idx > len(my_list) - 1:
        return list(my_list)
    new_list = list(my_list)
    new_list[idx] = element
    return new_list
EOF

cat > 5-no_c.py << 'EOF'
#!/usr/bin/python3
def no_c(my_string):
    return "".join([c for c in my_string if c != 'c' and c != 'C'])
EOF

cat > 6-print_matrix_integer.py << 'EOF'
#!/usr/bin/python3
def print_matrix_integer(matrix=[[]]):
    for row in matrix:
        for i in range(len(row)):
            if i != 0:
                print(" ", end="")
            print("{:d}".format(row[i]), end="")
        print()
EOF

cat > 7-add_tuple.py << 'EOF'
#!/usr/bin/python3
def add_tuple(tuple_a=(), tuple_b=()):
    a0 = tuple_a[0] if len(tuple_a) > 0 else 0
    a1 = tuple_a[1] if len(tuple_a) > 1 else 0
    b0 = tuple_b[0] if len(tuple_b) > 0 else 0
    b1 = tuple_b[1] if len(tuple_b) > 1 else 0
    return (a0 + b0, a1 + b1)
EOF

cat > 8-multiple_returns.py << 'EOF'
#!/usr/bin/python3
def multiple_returns(sentence):
    first = sentence[0] if len(sentence) > 0 else None
    return (len(sentence), first)
EOF

cat > 9-max_integer.py << 'EOF'
#!/usr/bin/python3
def max_integer(my_list=[]):
    if not my_list:
        return None
    max_value = my_list[0]
    for i in my_list:
        if i > max_value:
            max_value = i
    return max_value
EOF

cat > 10-divisible_by_2.py << 'EOF'
#!/usr/bin/python3
def divisible_by_2(my_list=[]):
    return [i % 2 == 0 for i in my_list]
EOF

cat > 11-delete_at.py << 'EOF'
#!/usr/bin/python3
def delete_at(my_list=[], idx=0):
    if idx < 0 or idx > len(my_list) - 1:
        return my_list
    return my_list[:idx] + my_list[idx + 1:]
EOF

cat > 12-switch.py << 'EOF'
#!/usr/bin/python3
a = 89
b = 10
a, b = b, a
print("a={} - b={}".format(a, b))
EOF

cat > README.md << 'EOF'
# python-data_structures

## Description
This project covers Python's built-in data structures: lists, tuples, and
lists of lists (matrices). It focuses on writing functions that operate on
these structures safely (bounds checking, avoiding mutation where needed)
without relying on higher-level builtins like `max()`, `pop()`, or
`str.replace()`.

| File | Description |
| --- | --- |
| `0-print_list_integer.py` | Prints all integers of a list, one per line |
| `1-element_at.py` | Safely retrieves an element from a list by index |
| `2-replace_in_list.py` | Replaces an element in a list at a given index |
| `3-print_reversed_list_integer.py` | Prints all integers of a list in reverse order |
| `4-new_in_list.py` | Returns a copy of a list with one element replaced |
| `5-no_c.py` | Removes all `c` and `C` characters from a string |
| `6-print_matrix_integer.py` | Prints a matrix of integers |
| `7-add_tuple.py` | Adds two tuples element-wise, padding missing values with 0 |
| `8-multiple_returns.py` | Returns a tuple of a string's length and its first character |
| `9-max_integer.py` | Finds the biggest integer in a list without using `max()` |
| `10-divisible_by_2.py` | Returns a list of booleans for divisibility by 2 |
| `11-delete_at.py` | Deletes the item at a given index in a list without using `pop()` |
| `12-switch.py` | Swaps the values of two variables |

## Requirements
- All scripts run on Ubuntu 20.04 LTS with python3 (3.8.5)
- All code follows pycodestyle (2.7.*)
- Every file starts with `#!/usr/bin/python3`
- Every file ends with a new line and is executable
EOF

chmod +x 0-print_list_integer.py 1-element_at.py 2-replace_in_list.py \
          3-print_reversed_list_integer.py 4-new_in_list.py 5-no_c.py \
          6-print_matrix_integer.py 7-add_tuple.py 8-multiple_returns.py \
          9-max_integer.py 10-divisible_by_2.py 11-delete_at.py 12-switch.py

echo "All files + README.md created and made executable."
echo "wc -l 12-switch.py check:"
wc -l 12-switch.py
echo "Running quick sanity checks..."
./12-switch.py
