---
title: Bash Commands
slug: commands
summary: Commonly used bash commands
weight: 2
---

# Common Concepts
## Key Bindings
| Key Binding | Description |
|-------------|-------------|
| `Ctrl + C`  | Kill the current process |
| `Ctrl + D`  | Exit the shell |
| `Ctrl + R`  | Search command history |
| `Ctrl + L`  | Clear the screen |
| `Ctrl + Shift + C` | Copy |
| `Ctrl + Shift + V` | Paste |
| `Tab`       | Autocomplete |

## Redirection
Generally, the output of a command is displayed in the terminal. However, you can redirect the output to a file or another command using redirection operators.

There are three standard streams:
- `stdin` (0): Standard input
- `stdout` (1): Standard output
- `stderr` (2): Standard error

### Output Redirection
| Operation      | Description                                      |
|----------------|--------------------------------------------------|
| `>`            | Redirect `stdout`                                |
| `>>`           | Append `stdout`                                  |
| `2>`           | Redirect `stderr`                                |
| `2>>`          | Append `stderr`                                  |
| `&>`           | Redirect both `stdout` and `stderr`              |
| `&>>`          | Append both `stdout` and `stderr`                |
| `2>&1`         | Redirect `stderr` to `stdout`                    |
| `> FILE 2>&1 ` | Redirect `stderr` and `stdout` to FILE           |

The general syntax for output redirection is:
```
COMMAND REDIRECTION FILEDESCRIPTOR
```
For example,
```bash
echo "Hello World!" > file.txt
```
The `>` operator redirects the output.\
The `>>` operator appends the output.\
This distrinction is not important when working with the standard streams, but it is when working with files.
`>` will overwrite the file, while `>>` will append to the file.\
\
The operator may be preceded by a file descriptor to specify the stream to redirect:
```bash
echo "Error!" 1> error.txt
```
\
It is also possible to redirect one stream to another:
```bash
echo "Error!" 2>&1
```
Here `2` (stderr) is redirected to `1` (stdout).\
The `&` is used to indicate that the following number is a file descriptor, and not a file named `1`.\
Note that no space between `>` and `&` is allowed.\
\
There can also be multiple redirections, which are evaluated from left to right:
```bash
echo "Error!" > error.txt 2>&1
```
First, `stdout` is redirected to `error.txt`, then `stderr` is redirected to whatever `stdout` is currently pointing at.\
For this special case of redirecting both `stdout` and `stderr` to the same file, there is a shorthand:
```bash
echo "Error!" &> error.txt
```

### Pipe
The pipe operator `|` is used to chain commands together.\
The output of the first command is passed as input to the second command.

Similarly to output redirection, the pipe operator only affects `stdout`.\
To pipe both `stdout` and `stderr`, `stderr` needs to be redirected first:
```bash
ls -l 2>&1 | less
```

Once again, there is a shorthand for this:
```bash
ls -l |& less
```

## Subshells
A subshell is a child process of the shell.\
It is created by enclosing a command in parentheses:
```bash
(cd /path/to/directory && ls)
```
The `cd` command is executed in a subshell, so the current directory of the main shell is not changed.\
The subshell "inherits" the standard streams of the main shell, so the output of the `ls` command is displayed in the terminal.

More often than not, you will encounter the subshell syntax as part of a command substitution.

## Command Substitution
Command substitution allows the output of a command to be used as an argument to another command.\
There are two ways to perform command substitution:
- `$(COMMAND)`
- `` `COMMAND` ``
```bash
echo "Today is $(date)"
```
```bash
echo "Today is `date`"
```
Both of these commands will display the current date.

## Variables
Variables are used to store strings or numbers.\
There are two types of variables:
- Environment variables
- Shell variables

Environment variables are available to all processes spawned from the current shell, while shell variables are only available to the current shell itself.

Variables are assigned using the `=` operator, and accessed using the `$` operator:

```bash
export VARIABLE=value # Environment variable
VAR=val               # Shell variable

echo $VARIABLE        # Prints "value"
echo $VAR             # Prints "val"

bash                  # Start a new shell
echo $VARIABLE        # Prints "value"
echo $VAR             # Prints nothing
exit                  # Exit the shell
```

## Pathname and Brace Expansion
`*` is a wildcard that can be used to match filenames.\
For example, `*.txt` will match all files with the `.txt` extension.

Brace expansion is used to generate arbitrary strings.\
For example, this will create the files `file1.txt`, `file2.txt`, and `file3.txt`:
```bash
touch file{1,2,3}.txt
```

# Help pages

## man
#### Description
Display manual pages
#### Usage
```bash
man COMMAND
```
#### Example
```bash
man ls
```

## -\-help
#### Description
Display help information
#### Usage
```bash
COMMAND --help
```
#### Example
```bash
ls --help
```

# Navigation

## cd
#### Description
Change directory
#### Usage
```bash
cd DIRECTORY
```
#### Example
```bash
cd ~/Documents # Change to the Documents directory (~ = home directory)
cd             # Change to the home directory
cd ..          # Change to the parent directory
```

## ls
#### Description
List directory content
#### Usage
```bash
ls DIRECTORY
```
#### Example
```bash
ls ~/Documents # List the contents of the Documents directory
ls             # List the contents of the current directory
ls -l          # Long format
ls -a          # Include hidden files
ls -h          # Human-readable sizes
ls -lah        # All of the above
```

# Basic Commands

## pwd
#### Description
Print working directory
#### Usage
```bash
pwd
```

## cp
#### Description
Copy files or directories
#### Usage
```bash
cp SOURCE DESTINATION
```
#### Example
```bash
cp file.txt /home/user/Documents/     # Copy a file
cp -r directory /home/user/Documents/ # Copy a directory
```

## mv
#### Description
Move/rename files or directories
#### Usage
```bash
mv SOURCE DESTINATION
```
#### Example
```bash
mv oldname.txt newname.txt
```

## rm
#### Description
Remove files or directories
#### Usage
```bash
rm FILE
```
#### Example
```bash
rm file.txt     # Remove a file
rm -d directory # Remove a directory
rm -r directory # Recursively remove a directory
```

## mkdir
#### Description
Create directories
#### Usage
```bash
mkdir DIRECTORY
```
#### Example
```bash
mkdir directory
mkdir directory/subdirectory    # Create nested directories, will fail if directory does not exist
mkdir -p directory/subdirectory # Create parent directories if they do not exist
```

## touch
#### Description
Create empty files
#### Usage
```bash
touch FILE
```

# File Permissions

## chmod
#### Description
Change file modes or Access Control Lists
#### Usage
```bash
chmod MODE FILE
```
#### Example
```bash
chmod 755 script.sh
```

## chown
#### Description
Change file owner and group
#### Usage
```bash
chown OWNER:GROUP FILE
```

## chgrp
#### Description
Change group ownership
#### Usage
```bash
chgrp GROUP FILE
```

# Process Management

## tmux
#### Description
Terminal multiplexer
#### Usage
```bash
tmux        # Start a new session
tmux attach # Attach to the last session
tmux detach # Detach from the current session
```
Press `Ctrl + b` followed by `c` to create a new window.\
Press `Ctrl + b` followed by `0-9` to switch to a specific window.\
Press `Ctrl + b` followed by `n` to switch to the next window.\
Press `Ctrl + b` followed by `p` to switch to the previous window.\
Press `Ctrl + b` followed by `d` to detach from the current session.

## htop
#### Description
Display Linux tasks
#### Usage
```bash
htop
```

# File Compression

## tar
#### Description
Archive files
#### Usage
```bash
tar OPTIONS
```
#### Example
```bash
# Create a (compressed) tarball containing file1.txt and file2.txt
tar cf archive.tar.gz file1.txt file2.txt
# Extract the tarball
tar xf archive.tar.gz
```

## gzip
#### Description
Compress files
#### Usage
```bash
gzip FILE
zip FILE
```

## gunzip
#### Description
Decompress files
#### Usage
```bash
gunzip FILE.gz
unzip FILE.zip
```

# Disk Usage

## df
#### Description
Report file system disk space usage
#### Usage
```bash
df
```
#### Example
```bash
df -h # (h)uman-readable
```

## du
#### Description
Estimate file space usage
#### Usage
```bash
du
```
#### Example
```bash
du -sh . # (s)ummarize, (h)uman-readable
```

# Searching

## grep
#### Description
Print lines that match patterns
#### Usage
```bash
grep PATTERN FILE
```
#### Example
```bash
grep "hello" file.txt
grep -c "hello" file.txt   # Count the number of matches
grep -N "hello" file.txt   # Show line numbers
grep -i "hello" file.txt   # Case-insensitive
grep -v "hello" file.txt   # Invert match, i.e. show non-matching lines
grep -m 2 "hello" file.txt # Stop after 2 matches
```

## find
#### Description
Search for files in a directory hierarchy
#### Usage
```bash
find DIRECTORY -name PATTERN
```
#### Example
```bash
find . -name "*.txt" # Find all .txt files in current directory
find ~ -type d       # Find all directories in home directory
```

# Text Processing

## cat
#### Description
Concatenate and display files
#### Usage
```bash
cat FILE
```
#### Example
```bash
cat file1.txt file2.txt
```

## echo
#### Description
Display a line of text
#### Usage
```bash
echo TEXT
```
#### Example
```bash
echo "Hello, World!"
echo -e "Hello\nWorld!" # Interpret backslash escapes (\n, \t, etc.)
echo -n "Hello, World!" # Do not output the trailing newline
```

## awk
#### Description
Pattern scanning and processing language
#### Usage
```bash
awk 'PATTERN {ACTION}' FILE
```
#### Example
```bash
awk '{print $1}' file.txt                         # Print the first column
awk '{ sum += $1 } END { print sum/NR }' file.txt # Print the average of the first column
```

## sed
#### Description
Stream editor for filtering and transforming text
#### Usage
```bash
sed OPTIONS
```
#### Example
```bash
sed 's/hello/world/' file.txt      # Print file, substitute OLD with NEW
sed 's/hello/world/g' file.txt     # Print file, substitute OLD with NEW globally
sed -i 's/hello/world/g' file.txt  # Like above, but edit file in place
sed -i 's@hello@world@g' file.txt  # Like above, but use @ as delimiter instead of /
sed -n '1,5p' file.txt             # Print lines 1-5
sed -n '/hello/p' file.txt         # Print lines containing "hello"
sed -n '/hello/,/world/p' file.txt # Print lines between "hello" and "world"
sed -n '/hello/,+2p' file.txt      # Print lines between "hello" and the next 2 lines
sed '/^$/d' file.txt               # Delete/Do not print empty lines
sed '/hello/d' file.txt            # Delete/Do not print lines containing "hello"
```

## less
#### Description
Display output one screen at a time
#### Usage
```bash
less FILE
```
#### Example
```bash
less file.txt
```

## head
#### Description
Output the first part of files
#### Usage
```bash
head FILE
```
#### Example
```bash
head file.txt
head -n 2 file.txt # Print the first 2 lines
```

## tail
#### Description
Output the last part of files
#### Usage
```bash
tail FILE
```
#### Example
```bash
tail file.txt
tail -n 2 file.txt  # Print the last 2 lines
tail -n +2 file.txt # Print all but the first 2 lines
```

## cut
#### Description
Remove sections from each line of files
#### Usage
```bash
cut OPTIONS FILE
```
#### Example
```bash
cut -d, -f1 file.csv # Print the first column, separated by commas
```

## sort
#### Description
Sort lines of text files
#### Usage
```bash
sort FILE
```

## uniq
#### Description
Report or omit repeated lines
#### Usage
```bash
uniq FILE
```
#### Example
```bash
uniq file.txt    # Print unique lines
uniq -c file.txt # Count the number of occurrences
uniq -d file.txt # Only print duplicate lines
```

## wc
#### Description
Print newline, word, and byte counts for each file
#### Usage
```bash
wc FILE
```
#### Example
```bash
wc file.txt
wc -l file.txt # Print the number of lines
wc -w file.txt # Print the number of words
wc -c file.txt # Print the number of bytes (characters)
```

## tr
#### Description
Translate or delete characters
#### Usage
```bash
tr OPTIONS
```
#### Example
```bash
echo "Hello, World!" | tr '[:lower:]' '[:upper:]' # Translate lowercase to uppercase
echo "Hello, World!" | tr -d '[:space:]'          # Delete whitespace
```

## diff
#### Description
Compare files line by line
#### Usage
```bash
diff FILE1 FILE2
```

# Text Editors

## nano
#### Description
Simple text editor
#### Usage
```bash
nano FILE
```
Use `Ctrl + O` to save and `Ctrl + X` to exit.

## vim
#### Description
Advanced text editor
#### Usage
```bash
vim FILE
```
Press `i` to enter insert mode, `Esc` to exit insert mode, `:w` to save, and `:q` to exit.

# Networking

## ssh
#### Description
Remote login
#### Usage
```bash
ssh USER@HOST
```

## scp
#### Description
Remote file copy
#### Usage
```bash
scp SOURCE USER@HOST:DESTINATION
```
Essentially a combination of `ssh` and `cp`, and supports the same options.

## wget
#### Description
Download files from the web
#### Usage
```bash
wget URL
```

## curl
#### Description
Transfer data from or to a server
#### Usage
```bash
curl URL
```

