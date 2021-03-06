# mampenv - PHP CLI multi-version management for MAMP

* [Overview](#Overivew)
  * [Key features](#key-features)
  * [How it works](#how-it-works)
* [Installation](#installation)
  * [Basic github checkout](#basic-github-checkout) 
  * [Upgrading](#upgrading)
* [Usage](#usage)
  * [mampenv versions](#mampenv-versions)
  * [Anchoring your project](#anchoring-your-project)
* [Contributing](#contributing)
* [License](#license)

## Overview

mampenv is here to help you make sure that your command line is running the same
version that your MAMP Pro sites are running.

Put a `.phpversion` file in the root of your folder and have the peace
of mind of knowing that your PHP CLI version matches the version
MAMP Pro is running for your site.

### Key features:

 * Inspired by [phpenv](https://github.com/phpenv/phpenv) and [rbenv](https://github.com/sstephenson/rbenv) 
 * Run MAMP-supported PHP versions directly from the command line
 * Run `composer` using the correct PHP version
 * Use project-specific versions of MAMP's PHP installations
 * PEAR? PECL? Oh yes, each MAMP version of PHP already has that

### How It Works

mampenv operates on the per-user directory `~/.mampenv`. This directory
contains shim-style scripts that take over the `php` and `composer` commands
on the command line. It will make sure they are executed using the PHP version
specified in your project folder's `.phpversion` file, if one is present. Otherwise,
it will use the latest version of PHP supplied with MAMP.

Each MAMP PHP version is a stand-alone installation with its own binaries and configuration.

## Installation

### Basic GitHub Checkout

This will get you going with the latest version of mampenv and make it
easy to fork and contribute any changes back upstream.

1. Check out mampenv into `~/.mampenv`.

        cd
        git clone git://github.com/benallfree/mampenv.git .mampenv

2. Add `~/.mampenv/bin` to your `$PATH` for access to the `mampenv` command-line utility.

        echo 'export PATH="$HOME/.mampenv/bin:$PATH"' >> ~/.bash_profile

4. Restart your shell so the path changes take effect. You can now begin using mampenv.

        source ~/.bash_profile

5. If all goes well, `which php` should indicate a `~/.mampenv/bin/php` path. `which composer` should say `~/.mampenv/bin/composer` and `which pecl` should say `~/.mampenv/bin/pecl`

### Upgrading

If you've installed mampenv using the instructions above, you can
upgrade your installation at any time using git.

To upgrade to the latest development version of mampenv, use `git pull`:

    cd ~/.mampenv
    git pull

## Usage

Like `git`, the `mampenv` command delegates to subcommands based on its
first argument. The most common subcommands are:

### mampenv versions

List the local MAMP PHP versions installed.

    mampenv versions

### mampenv init

Create a new `.phpversion` file in the current directory.

    mampenv init 7.1.0

### Anchoring your project

First, see what versions are available on your system. 

    mampenv versions

If you don't like any you see, visit the [MAMP Pro Downloads](http://www.mamp.info/en/downloads/) section and download more.

Next, navigate to your project directory and create a `.phpversion` file.

    cd ~/my_project
    echo "5.5.10" > .phpversion

Now test the version.

    which php                 <-- Should say ~/.mampenv/bin/php
    php -v

## Contributing

The mampenv source code is [hosted on
GitHub](https://github.com/benallfree/mampenv). It's clean, modular,
and easy to understand, even if you're not a
shell hacker.

## License

(The MIT license)

Copyright (c) 2014 Ben Allfree

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
