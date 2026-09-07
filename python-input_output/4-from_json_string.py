#!/usr/bin/python3
"""Module that provides JSON deserialization functionality."""
import json


def from_json_string(my_str):
    """Returns an object represented by a JSON string."""
    return json.loads(my_str)
