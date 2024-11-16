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

<img src="assets/download.jpeg" alt="rgrep Logo" width="200" />

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

1. Ensure Ruby is installed on your system.
2. Clone or download the `rgrep` repository.
3. Navigate to the directory where `rgrep.rb` is located.

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
