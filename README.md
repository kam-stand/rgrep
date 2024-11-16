# rgrep: A Ruby-Based grep-like Utility

rgrep is a Ruby command-line utility designed to search plain-text data files for lines that match a pattern or regular expression. Inspired by the Unix `grep` command, `rgrep` offers flexible options for text searching and filtering. This utility can be used on both Unix-based systems and Windows, making it a portable and versatile tool for developers and system administrators.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Options](#options)
6. [Examples](#examples)
7. [Error Handling](#error-handling)
8. [License](#license)

---

## Introduction

<img src="assets/download.jpeg" alt="rgrep Logo" width="400" />

`rgrep` provides powerful pattern-matching capabilities using command-line options. It supports multiple search modes, including word search, regular expression search, and negated matching. Additional functionalities allow users to count or extract matches. With its simple interface, `rgrep` is a handy tool for text processing tasks.

---

## Features

- 🔍 Search for specific words or patterns in files.
- 📜 Supports regular expressions for advanced pattern matching.
- ❌ Option to exclude lines that match a pattern.
- 📊 Count the number of matching lines.
- ✂️ Extract matching portions from the text.
- 🛠️ Built-in error handling for invalid options or arguments.

---

## Installation

1. Ensure Ruby is installed on your system. [Ruby Installation Guide](https://www.ruby-lang.org/en/documentation/installation/)
2. Clone or download the `rgrep` repository.

```bash
$ git clone https://github.com/kam-stand/rgrep-git
```

3. Navigate to the directory where `rgrep.rb` is located.

```bash
$ cd rgrep
```

4. Run the script using Ruby:

```bash
$ ruby rgrep.rb [options] <pattern> <filename>
```

Alternatively, you can make `rgrep.rb` executable on a Unix-based system:

```bash
$ chmod +x rgrep.rb
$ ./rgrep.rb [options] <pattern> <filename>
```

---

## Usage

### On Unix-based Systems

Use the script directly:

```bash
$ path/to/rgrep/rgrep.rb [options] <pattern> <filename>

```

## Options

| **Option**     | **Description**                                                                           | **Notes**               |
| -------------- | ----------------------------------------------------------------------------------------- | ----------------------- |
| `-w <pattern>` | Treats `<pattern>` as a word. Returns all lines containing the word.                      |                         |
| `-p <pattern>` | Treats `<pattern>` as a regular expression. Returns all lines matching the regex.         | Default option.         |
| `-v <pattern>` | Treats `<pattern>` as a regular expression. Returns all lines **not** matching the regex. |                         |
| `-c <pattern>` | Used with `-w`, `-p`, or `-v`. Returns the number of lines that match the pattern.        | Must be used with `-p`. |
| `-m <pattern>` | Used with `-w` or `-p`. Returns the matched part of each line that matches the pattern.   | Must be used with `-p`. |

```

```

## Examples

### Example 1: Word Search

Search for the word "error" in a log file:

```bash
$ path/to/rgrep/rgrep.rb -w error /var/log/system.log
```

### Example 2: Regular Expression Search

Search for lines containing an email address pattern:

```bash
$ path/to/rgrep/rgrep.rb -p '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b' emails.txt
```

### Example 3: Negated Matching

Find lines that do not contain the word "success":

```bash
$ path/to/rgrep/rgrep.rb -v success output.log
```

### Example 4: Count Matching Lines

Count the number of lines that contain the word "warning":

```bash
$ path/to/rgrep/rgrep.rb -c -w warning /var/log/system.log
```

### Example 5: Extract Matching Portions

Extract email addresses from a text file:

```bash
$ path/to/rgrep/rgrep.rb -m -p '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b' emails.txt
```

## Error Handling

<img src="assets/Redem-Error.jpeg" alt="rgrep Logo" width="400" />

`rgrep` includes robust error handling to ensure smooth operation and provide meaningful feedback to the user. Below are some common errors and how `rgrep` handles them:

- **Invalid Option**: If an unrecognized option is provided, `rgrep` will display an error message indicating the invalid option and provide a usage guide.

  ```bash
  $ path/to/rgrep/rgrep.rb -z pattern file.txt
  Error: Invalid option '-z'
  Usage: rgrep.rb [options] <pattern> <filename>
  ```

- **Missing Pattern**: If no pattern is provided, `rgrep` will prompt the user to supply a pattern to search for.

  ```bash
  $ path/to/rgrep/rgrep.rb -w
  Error: Missing pattern
  Usage: rgrep.rb [options] <pattern> <filename>
  ```

- **Missing Filename**: If no filename is provided, `rgrep` will prompt the user to supply a file to search in.

  ```bash
  $ path/to/rgrep/rgrep.rb -w pattern
  Error: Missing filename
  Usage: rgrep.rb [options] <pattern> <filename>
  ```

- **File Not Found**: If the specified file does not exist, `rgrep` will display an error message indicating the file could not be found.

  ```bash
  $ path/to/rgrep/rgrep.rb -w pattern non_existent_file.txt
  Error: File 'non_existent_file.txt' not found
  ```

- **Invalid Regular Expression**: If the provided regular expression is invalid, `rgrep` will display an error message indicating the issue with the regex.

  ```bash
  $ path/to/rgrep/rgrep.rb -p '[invalid_regex' file.txt
  Error: Invalid regular expression '[invalid_regex'
  ```

These error messages help users quickly identify and correct issues, ensuring a smoother experience with `rgrep`.
