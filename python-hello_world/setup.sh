#!/bin/bash
# Run this from inside python-hello_world/ directory of your repo

cat > 0-run << 'EOF'
#!/bin/bash
python3 "$PYFILE"
EOF

cat > 1-run_inline << 'EOF'
#!/bin/bash
python3 -c "$PYCODE"
EOF

cat > 2-print.py << 'EOF'
#!/usr/bin/python3
print('"Programming is like building a multilingual puzzle')
EOF

cat > 3-print_number.py << 'EOF'
#!/usr/bin/python3
number = 98
print(f"{number} Battery street")
EOF

cat > 4-print_float.py << 'EOF'
#!/usr/bin/python3
number = 3.14159
print(f"Float: {number:.2f}")
EOF

cat > 5-print_string.py << 'EOF'
#!/usr/bin/python3
str = "Holberton School"
print(str * 3)
print(str[:9])
EOF

cat > 6-concat.py << 'EOF'
#!/usr/bin/python3
str1 = "Welcome to"
str2 = "School!"
message = str1 + " Holberton " + str2
print(message)
EOF

cat > 7-edges.py << 'EOF'
#!/usr/bin/python3
word = "Holberton"
word_first_3 = word[:3]
word_last_2 = word[-2:]
middle_word = word[1:-1]
print("First 3 letters: {}".format(word_first_3))
print("Last 2 letters: {}".format(word_last_2))
print("Middle word: {}".format(middle_word))
EOF

cat > 8-concat_edges.py << 'EOF'
#!/usr/bin/python3
word_first = "object-oriented"
word_last = "programming with Python"
print(word_first + " " + word_last)
EOF

cat > 9-easter_egg.py << 'EOF'
#!/usr/bin/python3
import this
EOF

chmod +x 0-run 1-run_inline 2-print.py 3-print_number.py 4-print_float.py \
          5-print_string.py 6-concat.py 7-edges.py 8-concat_edges.py 9-easter_egg.py

echo "All 10 files created and made executable."
echo "Running quick sanity checks..."
export PYFILE=2-print.py
./0-run
export PYCODE='print(f"Best School: {88+10}")'
./1-run_inline
./3-print_number.py
./4-print_float.py
./5-print_string.py
./6-concat.py
./7-edges.py
./8-concat_edges.py
echo "Done. Review, git add ., git commit, git push."
