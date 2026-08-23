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
