# Cassiru Toolkit

**Cassiru** is a modular batch toolkit for Windows automation, scripting, and DevOps tasks.  
It is designed to be extensible, robust, and easy to use, with a focus on maintainability and modularity.

---

## Features

- Modular architecture: add your own commands as `.cmd` files in the `modules` folder
- Interactive mode: run modules and commands in a REPL-like environment
- Built-in commands: `help`, `list`, `version`, `interactive`
- Easy to extend and maintain

---

## Getting Started

### Folder Structure

```
cassiru.bat
modules/
    subprocess.cmd
    wifi_watch.cmd
scripts/
    usage.bat
    help.bat
    list.bat
    interactive.bat
```

### Usage

Run from the command line:

```sh
cassiru [command|module]
```

#### Examples

- Show usage/help:
  ```
  cassiru help
  ```
- List available modules:
  ```
  cassiru list
  ```
- Run a module:
  ```
  cassiru wifi_watch
  ```
- Start interactive mode:
  ```
  cassiru interactive
  ```

---

## Adding Modules

To add a new module, create a `.cmd` file in the `modules` directory.  
Example: `modules/wifi_watch.cmd`

```bat
@echo off
rem do anything here!

exit /b
```

Modules can prompt for user input, run system commands, or automate tasks.

---