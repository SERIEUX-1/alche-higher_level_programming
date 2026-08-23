#!/bin/bash
# Run this from inside python-if_else_loops_functions/ directory of your repo

cat > 0-positive_or_negative.py << 'EOF'
#!/usr/bin/python3
import random

number = random.randint(-10, 10)

if number > 0:
    print("{} is positive".format(number))
elif number == 0:
    print("{} is zero".format(number))
else:
    print("{} is negative".format(number))
EOF

cat > 1-last_digit.py << 'EOF'
#!/usr/bin/python3
import random

number = random.randint(-10000, 10000)

last_digit = number % 10
if number < 0 and last_digit != 0:
    last_digit -= 10

if last_digit > 5:
    print("Last digit of {} is {} and is greater than 5".format(
        number, last_digit))
elif last_digit == 0:
    print("Last digit of {} is {} and is 0".format(number, last_digit))
else:
    print("Last digit of {} is {} and is less than 6 and not 0".format(
        number, last_digit))
EOF

cat > 2-print_alphabet.py << 'EOF'
#!/usr/bin/python3
for i in range(97, 123):
    print("{:c}".format(i), end="")
EOF

cat > 3-print_alphabt.py << 'EOF'
#!/usr/bin/python3
for i in range(97, 123):
    if i != ord('q') and i != ord('e'):
        print("{:c}".format(i), end="")
EOF

cat > 4-print_hexa.py << 'EOF'
#!/usr/bin/python3
for i in range(99):
    print("{:d} = {:s}".format(i, hex(i)))
EOF

cat > 5-print_comb2.py << 'EOF'
#!/usr/bin/python3
for i in range(100):
    print("{:02d}".format(i), end="")
    print("\n" if i == 99 else ", ", end="")
EOF

cat > 6-print_comb3.py << 'EOF'
#!/usr/bin/python3
for i in range(10):
    for j in range(10):
        if i < j:
            print("{:d}{:d}".format(i, j), end="")
            print("\n" if i == 8 and j == 9 else ", ", end="")
EOF

cat > 7-islower.py << 'EOF'
#!/usr/bin/python3
def islower(c):
    return ord(c) >= ord('a') and ord(c) <= ord('z')
EOF

cat > 8-uppercase.py << 'EOF'
#!/usr/bin/python3
def uppercase(str):
    for c in str:
        if ord(c) >= ord('a') and ord(c) <= ord('z'):
            print("{:c}".format(ord(c) - 32), end="")
        else:
            print("{:c}".format(ord(c)), end="")
    print()
EOF

cat > 9-print_last_digit.py << 'EOF'
#!/usr/bin/python3
def print_last_digit(number):
    last_digit = abs(number) % 10
    print("{:d}".format(last_digit), end="")
    return last_digit
EOF

cat > 10-add.py << 'EOF'
#!/usr/bin/python3
def add(a, b):
    return a + b
EOF

cat > 11-pow.py << 'EOF'
#!/usr/bin/python3
def pow(a, b):
    return a ** b
EOF

cat > 12-fizzbuzz.py << 'EOF'
#!/usr/bin/python3
def fizzbuzz():
    for i in range(1, 101):
        if i % 15 == 0:
            print("FizzBuzz", end=" ")
        elif i % 3 == 0:
            print("Fizz", end=" ")
        elif i % 5 == 0:
            print("Buzz", end=" ")
        else:
            print(i, end=" ")
EOF

cat > README.md << 'EOF'
# python-if_else_loops_functions

## Description
This project covers conditional statements, loops, and functions in Python:
`if`/`elif`/`else` statements, `for`/`while` loops, string formatting with
`str.format()`, `ord()`/`chr()` for character-to-code conversions, and
writing reusable functions with prototypes.

| File | Description |
| --- | --- |
| `0-positive_or_negative.py` | Prints whether a random number is positive, negative, or zero |
| `1-last_digit.py` | Prints the last digit of a random number and describes it |
| `2-print_alphabet.py` | Prints the lowercase alphabet, no trailing new line |
| `3-print_alphabt.py` | Prints the lowercase alphabet except `q` and `e` |
| `4-print_hexa.py` | Prints numbers 0 to 98 in decimal and hexadecimal |
| `5-print_comb2.py` | Prints numbers 00 to 99, comma-separated |
| `6-print_comb3.py` | Prints all unique two-digit combinations in ascending order |
| `7-islower.py` | Function that checks whether a character is lowercase |
| `8-uppercase.py` | Function that prints a string in uppercase |
| `9-print_last_digit.py` | Function that prints and returns a number's last digit |
| `10-add.py` | Function that adds two integers |
| `11-pow.py` | Function that computes `a` to the power of `b` |
| `12-fizzbuzz.py` | Function that prints numbers 1-100, replacing multiples of 3/5 with Fizz/Buzz/FizzBuzz |

## Requirements
- All scripts run on Ubuntu 20.04 LTS with python3 (3.8.5)
- All code follows pycodestyle (2.7.*)
- Every file starts with `#!/usr/bin/python3`
- Every file ends with a new line and is executable
EOF

chmod +x 0-positive_or_negative.py 1-last_digit.py 2-print_alphabet.py \
          3-print_alphabt.py 4-print_hexa.py 5-print_comb2.py 6-print_comb3.py \
          7-islower.py 8-uppercase.py 9-print_last_digit.py 10-add.py \
          11-pow.py 12-fizzbuzz.py

echo "All files + README.md created and made executable."
echo "Running quick sanity checks..."
./0-positive_or_negative.py
./1-last_digit.py
echo
./2-print_alphabet.py; echo
./3-print_alphabt.py; echo
./4-print_hexa.py | head -5
./5-print_comb2.py
./6-print_comb3.py
echo "Done. Review, git add ., git commit, git push."
