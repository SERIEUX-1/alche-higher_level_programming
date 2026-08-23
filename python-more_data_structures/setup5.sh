#!/bin/bash
# Run this from inside python-more_data_structures/ directory of your repo

cat > 0-square_matrix_simple.py << 'EOF'
#!/usr/bin/python3
def square_matrix_simple(matrix=[]):
    return [[value ** 2 for value in row] for row in matrix]
EOF

cat > 1-search_replace.py << 'EOF'
#!/usr/bin/python3
def search_replace(my_list, search, replace):
    return [replace if value == search else value for value in my_list]
EOF

cat > 2-uniq_add.py << 'EOF'
#!/usr/bin/python3
def uniq_add(my_list=[]):
    return sum(set(my_list))
EOF

cat > 3-common_elements.py << 'EOF'
#!/usr/bin/python3
def common_elements(set_1, set_2):
    return set_1 & set_2
EOF

cat > 4-only_diff_elements.py << 'EOF'
#!/usr/bin/python3
def only_diff_elements(set_1, set_2):
    return set_1 ^ set_2
EOF

cat > 5-number_keys.py << 'EOF'
#!/usr/bin/python3
def number_keys(a_dictionary):
    return len(a_dictionary)
EOF

cat > 6-print_sorted_dictionary.py << 'EOF'
#!/usr/bin/python3
def print_sorted_dictionary(a_dictionary):
    for key in sorted(a_dictionary.keys()):
        print("{}: {}".format(key, a_dictionary[key]))
EOF

cat > 7-update_dictionary.py << 'EOF'
#!/usr/bin/python3
def update_dictionary(a_dictionary, key, value):
    a_dictionary[key] = value
    return a_dictionary
EOF

cat > 8-simple_delete.py << 'EOF'
#!/usr/bin/python3
def simple_delete(a_dictionary, key=""):
    if key in a_dictionary:
        del a_dictionary[key]
    return a_dictionary
EOF

cat > 9-multiply_by_2.py << 'EOF'
#!/usr/bin/python3
def multiply_by_2(a_dictionary):
    return {key: value * 2 for key, value in a_dictionary.items()}
EOF

cat > 10-best_score.py << 'EOF'
#!/usr/bin/python3
def best_score(a_dictionary):
    if not a_dictionary:
        return None
    best_key = None
    best_value = None
    for key, value in a_dictionary.items():
        if best_value is None or value > best_value:
            best_value = value
            best_key = key
    return best_key
EOF

cat > 11-multiply_list_map.py << 'EOF'
#!/usr/bin/python3
def multiply_list_map(my_list=[], number=0):
    return list(map(lambda value: value * number, my_list))
EOF

cat > 12-roman_to_int.py << 'EOF'
#!/usr/bin/python3
def roman_to_int(roman_string):
    if type(roman_string) is not str:
        return 0
    values = {'I': 1, 'V': 5, 'X': 10, 'L': 50,
              'C': 100, 'D': 500, 'M': 1000}
    total = 0
    prev = 0
    for c in reversed(roman_string):
        if c not in values:
            return 0
        value = values[c]
        if value < prev:
            total -= value
        else:
            total += value
            prev = value
    return total
EOF

cat > README.md << 'EOF'
# python-more_data_structures

## Description
This project goes further into Python data structures: matrices, list
comprehensions, sets, dictionaries, and functional tools like `map` and
`lambda`. It ends with a classic interview exercise: converting Roman
numerals to integers.

| File | Description |
| --- | --- |
| `0-square_matrix_simple.py` | Squares every value of a matrix, without modifying the original |
| `1-search_replace.py` | Replaces all occurrences of a value in a new list |
| `2-uniq_add.py` | Adds all unique integers in a list |
| `3-common_elements.py` | Returns the set of elements common to two sets |
| `4-only_diff_elements.py` | Returns the set of elements present in only one of two sets |
| `5-number_keys.py` | Returns the number of keys in a dictionary |
| `6-print_sorted_dictionary.py` | Prints a dictionary sorted by key |
| `7-update_dictionary.py` | Adds or replaces a key/value pair in a dictionary |
| `8-simple_delete.py` | Deletes a key from a dictionary if it exists |
| `9-multiply_by_2.py` | Returns a new dictionary with all values multiplied by 2 |
| `10-best_score.py` | Returns the key with the highest integer value |
| `11-multiply_list_map.py` | Multiplies every value of a list by a number, using `map` |
| `12-roman_to_int.py` | Converts a Roman numeral string to an integer |

## Requirements
- All scripts run on Ubuntu 20.04 LTS with python3 (3.8.5)
- All code follows pycodestyle (2.7.*)
- Every file starts with `#!/usr/bin/python3`
- Every file ends with a new line and is executable
EOF

chmod +x 0-square_matrix_simple.py 1-search_replace.py 2-uniq_add.py \
          3-common_elements.py 4-only_diff_elements.py 5-number_keys.py \
          6-print_sorted_dictionary.py 7-update_dictionary.py 8-simple_delete.py \
          9-multiply_by_2.py 10-best_score.py 11-multiply_list_map.py \
          12-roman_to_int.py

echo "All files + README.md created and made executable."
echo "wc -l 11-multiply_list_map.py check (must be <= 3):"
wc -l 11-multiply_list_map.py
echo "Done. Review, git add ., git commit, git push."
