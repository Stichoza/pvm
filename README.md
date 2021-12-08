# PVM - PHP Version Manager for MAMP Pro

Manages PHP versions for command line. Works with **zsh** autocomplete.

### Installation

Clone this repository anywhere on you computer and add `source path/to/pvm/pvm.sh` to your zsh config file (`~/.zshrc` in most cases).

### Usage

 - `pvm list`                          Show installed PHP versions
 - `pvm use 8.1.0`                     Switch current PHP binary version
 - `pvm 8.1.0`                         Run specific PHP version
 - `pvm 8.1.0 file.php`                Run file with specific PHP version
 - `pvm 8.1.0 -r "echo time()"`        Run script from string with specific PHP version
 - `pvm 8.1.0 -S 0.0.0.0:8080`         Start PHP 8.1.0 server on port 8080
 - *and so on...*
