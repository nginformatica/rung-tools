# Rung CLI

[![Build Status](https://travis-ci.org/rung-tools/rung-cli.svg?branch=master)](https://travis-ci.org/rung-tools/rung-cli)
[![Code Climate](https://codeclimate.com/github/rung-tools/rung-cli/badges/gpa.svg)](https://codeclimate.com/github/rung-tools/rung-cli)
[![Known Vulnerabilities](https://snyk.io/test/github/rung-tools/rung-cli/badge.svg)](https://snyk.io/test/github/rung-tools/rung-cli)
[![Codecov](https://codecov.io/gh/rung-tools/rung-cli/branch/master/graph/badge.svg)](https://codecov.io/gh/rung-tools/rung-cli)

Command line tools for Rung

## Installation

`sudo npm install -g rung-cli`

This will make the command `rung` available globally.

## Features

- Create blank extensions
- Generate `.rung` packages
- Run extensions locally in CLI mode
- Publish extensions to Rung Store
- Generate boilerplate code for extension
- Generate README.md file to publish

## Usage

`rung [build|run|publish|boilerplate|readme|db]`

### Commands


| Command       | Description |
|---------------|-------------|
| `build`       | Generate a .rung package |
| `run`         | Execute the current extension |
| `publish`     | Publishes extension to store |
| `boilerplate` | Generates boilerplate code for the extension |
| `readme`      | Generates the README.md file to publish |
| `db read`     | Read from extension database |
| `db clear`    | Drop extension database |

### Options

| Option           | Description |
|------------------|-------------|
| `-o`, `--output` | Where to save the built package |
| `--version`      | Displays versions |
