#!/bin/bash

# Create README.md
cat << 'EOF' > README.md
# Python - Everything is object

This repository contains answers and tasks exploring how Python handles objects, mutability, variable assignment, and memory references.
EOF

# Task 0
cat << 'EOF' > 0-answer.txt
type
EOF

# Task 1
cat << 'EOF' > 1-answer.txt
id
EOF

# Task 2
cat << 'EOF' > 2-answer.txt
No
EOF

# Task 3
cat << 'EOF' > 3-answer.txt
Yes
EOF

# Task 4
cat << 'EOF' > 4-answer.txt
Yes
EOF

# Task 5
cat << 'EOF' > 5-answer.txt
No
EOF

# Task 6
cat << 'EOF' > 6-answer.txt
True
EOF

# Task 7
cat << 'EOF' > 7-answer.txt
True
EOF

# Task 8
cat << 'EOF' > 8-answer.txt
True
EOF

# Task 9
cat << 'EOF' > 9-answer.txt
True
EOF

# Task 10
cat << 'EOF' > 10-answer.txt
True
EOF

# Task 11
cat << 'EOF' > 11-answer.txt
False
EOF

# Task 12
cat << 'EOF' > 12-answer.txt
True
EOF

# Task 13
cat << 'EOF' > 13-answer.txt
True
EOF

# Task 14
cat << 'EOF' > 14-answer.txt
[1, 2, 3, 4]
EOF

# Task 15
cat << 'EOF' > 15-answer.txt
[1, 2, 3]
EOF

# Task 16
cat << 'EOF' > 16-answer.txt
1
EOF

# Task 17
cat << 'EOF' > 17-answer.txt
[1, 2, 3, 4]
EOF

# Task 18
cat << 'EOF' > 18-answer.txt
[1, 2, 3]
EOF

# Task 19 - Python script (maximum 3 lines)
cat << 'EOF' > 19-copy_list.py
#!/usr/bin/python3
def copy_list(l):
    return l.copy()
EOF

# Task 20
cat << 'EOF' > 20-answer.txt
Yes
EOF

# Task 21
cat << 'EOF' > 21-answer.txt
Yes
EOF

# Task 22
cat << 'EOF' > 22-answer.txt
No
EOF

# Task 23
cat << 'EOF' > 23-answer.txt
Yes
EOF

# Task 24
cat << 'EOF' > 24-answer.txt
True
EOF

# Task 25
cat << 'EOF' > 25-answer.txt
False
EOF

# Task 26
cat << 'EOF' > 26-answer.txt
True
EOF

# Task 27
cat << 'EOF' > 27-answer.txt
No
EOF

# Task 28
cat << 'EOF' > 28-answer.txt
Yes
EOF

# Set executable permissions on all created files
chmod +x *-answer.txt 19-copy_list.py create_files.sh

echo "All project files and answers have been successfully generated and made executable."
