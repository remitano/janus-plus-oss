# Janus-Plus: Vim Tmux Git Distribution

This is a distribution of plug-ins and mappings for Vim, Gvim and
MacVim and Tmux and Git, originated from the awesome Janus

It is designed to provide minimal working environment using the most
popular plug-ins and the most common mappings.

The VIM of this distribution is completely customisable using a `~/.vimrc.before`
and `~/.vimrc.after` Vim RC files.

The tmux of this distribution is completely customisable using a `~/.tmux.local`
Tmux RC files

The git of this distribution is completely customisable using a `~/.gitconfig.local`
Git RC files

This distribution require git >= 2.19.1 for the hooks to work correctly.
You can do that by using `brew install git` and add this to your .bashrc
```bash
export PATH=/usr/local/bin:$PATH
```
## Updating to the latest version

To update to the latest version of the distribution, just run `rake`
inside your `~/.vim` directory.

NOTE: If you ever have an error updating Janus relating to a
missing commit in a submodule, please try running `rake` again before
submitting an issue.

## Testing changes without pushing to github
You can test your new changes to janus-plus-oss without pushing to github,
assume that your changes is on master branch of your
`/path/to/your/local/janus-plus-oss`

```bash
cd ~/.vim
rake
# you need run "rake" one time to make sure you get the local
# changes update ability which added recently
rake local[/path/to/your/local/janus-plus-oss,your_branch]
```

## Mailing list

The mailing list is hosted at [Google
Groups](http://groups.google.com/group/janus-vimius), please join it for
discussion and announcements.

## Pre-requisites

The distribution is designed to work with Vim >= 7.3.

The distribution also requires `ack`, `ctags`, `git`, `ruby` and `rake`.
For the most comfortable experience, use the GUI version of Vim. Linux
users should install `gvim`, OSX users should install
[MacVim](http://code.google.com/p/macvim/). The recommended way of
installing MacVim is using
[Homebrew](http://mxcl.github.com/homebrew/), but before installing
MacVim you need to use system-wide Python (If you are using python that
is):

* If you're using **pythonbrew**: do `pythonbrew off`

```bash
$ brew install macvim
```

If you don't use Homebrew, you can still download MacVim
[here](https://github.com/b4winckler/macvim/releases).

Take a look at the [Pre-requisites wiki
page](https://github.com/carlhuda/janus/wiki/Pre-requisites) for more
information.


## Installation

To install Janus, please use our [automatic
installer](https://github.com/carlhuda/janus/blob/master/bootstrap.sh)
, which backs up any Vim files found in your home folder and installs
Janus (require nodejs >= 12.12).

```bash
$ curl -L https://raw.github.com/remitano/janus-plus-oss/master/bootstrap.rb | ruby
```
To force an install over existing default janus distribution

```bash
$ curl -L https://raw.github.com/remitano/janus-plus-oss/master/bootstrap.rb | FORCED=1 ruby
```

## Customization

You can use `~/.gvimrc.before` and `~/.vimrc.before` for settings Janus itself uses,
such as the __leader__ setting. You may also use `~/.gvimrc.after` and
`~/.vimrc.after` for any additional settings; it is also a good place for
overriding Janus settings, as both files will be loaded at the end of
Janus.

For example, to override the default color schemes:

```bash
$ echo 'color desert'  >> ~/.vimrc.after
$ echo 'color molokai' >> ~/.gvimrc.after
```

If you want to do additional customization or add more Vim plugins,
create a `~/.janus` directory and add your plugins there, either with a
`git clone` or by adding submodules to your own git repository there.
This directory is treated like a normal pathogen directory. For example:

```bash
$ cd ~/.janus
$ git clone https://github.com/vim-scripts/Rename2.git rename2
```

Or, if you have a git repository in `~/.janus`, you can use a submodule:

```bash
$ cd ~/.janus
$ git submodule add https://github.com/vim-scripts/Rename2.git rename2
```

If you would like to disable an included plug-in, you can do that with
the `janus#disable_plugin()` function from inside your
`~/.vimrc.before`. This function takes a plug-in name as an argument
without the group. For example, if you would like to disable the
NERDCommenter plug-in, you can do that with the command:

```bash
$ echo "call janus#disable_plugin('nerdcommenter')" >> ~/.vimrc.before
```

**WARNING**: We've noticed over and over, that people fork Janus just to
customize it. This is bad practice for several reasons and you should
not do that, and here's why:

- Janus is fully customisable and there's no need to change the core for
  using a different plugin fork or using a different mapping.
- Forking means maintenance; maintenance means burden. Do not burden
  yourself with maintaining a fork; that's what the `~/.janus` folder
  is for.

If you find yourself needing a customisation that is not possible with
the current setup, then please open an issue or consider submitting a
pull request to make it possible to continue using/improving the official repo.

**WARNING**: Any **uncommited** files inside the **janus** folder will be
removed the next time you run `rake` so make sure to either put them in
the custom folder (`~/.janus`), or commit them. We clean the janus
folder in case we replace a manually installed plugin (using rake tasks)
with a submodule.

For more information on how to customize Janus, you might want to take
a look at the [Customization wiki
page](https://github.com/carlhuda/janus/wiki/Customization).
Additional you can see [Example](https://github.com/khusnetdinov/.janus) of customization.

# Intro to VIM

Here're some tips in case you've never used VIM before:

## Tutorials

* Type `vimtutor` into a shell to go through a brief interactive
  tutorial inside VIM.
* Watch this presentation at [VIM: Walking Without Crutches](https://vimeo.com/16458939) or read the [slides on Speaker Deck](https://speakerdeck.com/nelstrom/vim-precision-editing-at-the-speed-of-thought).
* Watch the screencasts at [vimcasts.org](http://vimcasts.org/)
* Watch Derek Wyatt's energetic tutorial videos at [his site](http://derekwyatt.org/vim/tutorials/)
* Read wycats' perspective on learning Vim at
  [Everyone who tried to convince me to use vim was wrong](http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/)
* Read this and other answers to a question about vim at StackOverflow:
  [Your problem with Vim is that you don't grok vi](http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)
* Read the [Getting Started with Vim](http://www.sitepoint.com/getting-started-vim/) tutorial on SitePoint
* Read the [Effective Rails Development with Vim](http://www.sitepoint.com/effective-rails-development-vim/) tutorial on SitePoint

## Modes

* VIM has three modes:
  * insert mode- stuff you type is added to the buffer
  * normal mode- keys you hit are interpreted as commands
  * visual mode- allows you to select blocks of text
* To enter insert mode, hit `i`
* To exit insert mode, hit `<ESC>`
* To enter visual mode, hit `v`
* To exit visual mode, hit `<ESC>`

## Installing Plugins

`remitano/janus-plus-oss` uses [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins.

Before you can use vim, you need to run `:PlugInstall`. Please reference the vim-plug repo for more info.

| Command                             | Description                                                        |
| ----------------------------------- | ------------------------------------------------------------------ |
| `PlugInstall [name ...] [#threads]` | Install plugins                                                    |
| `PlugUpdate [name ...] [#threads]`  | Install or update plugins                                          |
| `PlugClean[!]`                      | Remove unlisted plugins (bang version will clean without prompt) |
| `PlugUpgrade`                       | Upgrade vim-plug itself                                            |
| `PlugStatus`                        | Check the status of plugins                                        |
| `PlugDiff`                          | Examine changes from the previous update and the pending changes   |
| `PlugSnapshot[!] [output path]`     | Generate script for restoring the current snapshot of the plugins  |

## Useful commands

* Use `:q` to exit vim
* Certain commands are prefixed with a `<Leader>` key, which maps to `\`
  by default. You can, for example, use `let mapleader = ","` to change this to a comma. If you want this
  to be in effect for uses of `<Leader>` in the .vimrc file, make sure to define
  this in `~/.vimrc.before`
* Keyboard [cheat sheet](http://vim.rtorr.com/).

# Features

This Vim distribution includes a number of packages built by others.

## Base Customizations

Janus ships with a number of basic customizations for vim:

* Line numbers
* Ruler (line and column numbers)
* No wrap (turn off per-buffer via :set wrap)
* Soft 2-space tabs, and default hard tabs to 2 spaces
* Show trailing whitespace as `.`
* Make searching highlighted, incremental, and case insensitive unless a
  capital letter is used
* Always show a status line
* Allow backspacing over everything (indentations, eol, and start
  characters) in insert mode
* `<C-P>` inserts the directory of the current file into a command
* Automatically resize splits when resizing the Vim window (GUI only)
* `<leader>ew` expands to `:e (directory of current file)/` (open in the
  current buffer)
* `<leader>es` expands to `:sp (directory of current file)/` (open in a
  horizontal split)
* `<leader>ev` expands to `:vsp (directory of current file)/` (open in
  a vertical split)
* `<leader>et` expands to `:tabe (directory of current file)/` (open in
  a new tab)
* Write a privileged file with `:SudoW` or `:SudoWrite`, it will prompt
  for sudo password when writing
* `<F4>` toggles paste mode
* `<leader>fef` formats the entire file
* `<leader>u` converts the entire word to uppercase
* `<leader>l` converts the entire word to lowercase
* `<leader>U` converts the first char of a word to uppercase
* `<leader>L` converts the first char of a word to lowercase
* `<leader>cd` changes the path to the active buffer's file
* `<leader>md` creates the directory of the active buffer's file
  (For example, when editing a new file for which the path does not
exist.)
* `gw` swaps the current word with the following word
* `<leader>ul` underlines the current line with `=`
* `<leader>tw` toggles wrap
* `<leader>fc` finds the next conflict marker (tested with Git
  conflicted files)
* Remap `<Down>` and `<Up>` to `gj` and `gk` (Wrapped text is not
  considered a single long line of text.)
* `<leader>hs` toggles highlight search
* `<leader>=` adjusts viewports to the same size (`<C-w>=`)
* `<A-[` (`<D-[` on MacVim) shifts current line or selected lines
  rightwards
* `<A-]` (`<D-]` on MacVim) shifts current line or selected lines
  leftwards
* `<C-W>!` invokes kwbd plugin; it closes all open buffers in the open
  windows but keeps the windows open

## [Ack.vim](http://github.com/mileszs/ack.vim)

Ack.vim uses ack to search inside the current directory for a pattern.
You can learn more about it with :help Ack.

**Customizations**: Janus rebinds command-shift-f (`<D-F>`) to bring up
`:Ack `.

## [Yggdroot/LeaderF](https://github.com/Yggdroot/LeaderF)
This plugin is mainly used for locating files, buffers, mrus, tags in large project.

## [NERDCommenter](http://github.com/ddollar/nerdcommenter)

NERDCommenter allows you to wrangle your code comments, regardless of
filetype. View `:help NERDCommenter` for all the details.

**Customizations**: Janus binds command-/ (`<D-/>`) to toggle comments.

## [NERDTree](https://github.com/scrooloose/nerdtree)

NERDTree is a file explorer plugin that provides "project drawer"
functionality to your vim projects.  You can learn more about it with
:help NERDTree.

**Customizations**: Janus adds a number of customizations to the core
NERDTree:

* Use `<Leader>n` to toggle NERDTree
* Ignore compiled ruby, python, and java files
* When opening vim with vim /path, open the left NERDTree to that
  directory, set the vim pwd, and clear the right buffer
* In general, assume that there is a single NERDTree buffer on the left
  and one or more editing buffers on the right

## [Unimpaired](https://github.com/tpope/vim-unimpaired)

This plugin provides a lot of useful mappings, here's a brief example of
what it does provide:

* `[b` to go to the previous buffer
* `]b` to go to the next buffer
* `[n` to go to the previous SCM conflict marker
* `]n` to go to the next SCM conflict marker

Please check [`:help
unimpaired`](https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt)
for a complete list

## [SuperTab](http://github.com/ervandew/supertab)

In insert mode, start typing something and hit `<TAB>` to tab-complete
based on the current context.

## [Syntastic](https://github.com/scrooloose/syntastic/)

Syntastic is a syntax checking plugin that runs files through external syntax
checkers as they are saved and opened. If syntax errors are detected, the user
is notified and is happy because they didn't have to compile their code or
execute their script to find them.

Please see [`:help
syntastic`](https://github.com/vim-syntastic/syntastic/blob/master/doc/syntastic.txt)
for more information.

## [Tagbar](https://github.com/majutsushi/tagbar)

Tagbar is a vim plugin for browsing the tags of source code files.

**Customizations**: Janus binds `<Leader>rt` to toggle Tagbar.

## [SnipMate](https://github.com/garbas/vim-snipmate)
SnipMate defines text snippets (a series of characters) that expand to
a useful piece of code when tab is pressed.  For example, in a Ruby
file, def`<TAB>` expands to:
```ruby
def method_name

end
```
After typing in the method name, press tab again to put the cursor right
where you want it on the next line.  [This repository](https://github.com/honza/vim-snippets/tree/master/snippets)
has a full list of the Snippets that are available in Janus.

## [EasyMotion](https://github.com/Lokaltog/vim-easymotion)

EasyMotion provides a much simpler way to use some motions in vim. It
takes the `<number>` out of `<number>w` or `<number>f{char}` by highlighting
all possible choices and allowing you to press one key to jump directly
to the target.

When one of the available motions is triggered, all visible text
preceding or following the cursor is faded, and motion targets are
highlighted.

EasyMotion is triggered by one of the provided mappings.

check EasyMotion's [home
page](https://github.com/Lokaltog/vim-easymotion) for more information.

## [NrrwRgn](https://github.com/chrisbra/NrrwRgn)

Narrowing means focussing on a region and making the rest inaccessible.
You simply select the region, call :NarrowRegion and the selected part
will open in a new scratch buffer. The rest of the file will be
protected, so you won't accidentally modify that buffer. In the new
buffer, you can do a global replace, search or anything else to modify
that part. When you are finished, simply write that buffer (e.g. by
|:w|) and your modifications will be put in the original buffer making
it accessible again.

## Git Support ([Fugitive](http://github.com/tpope/vim-fugitive))

Fugitive adds pervasive git support to git directories in vim. For more
information, use `:help fugitive`

Use `:Gstatus` to view `git status` and type `-` on any file to stage or
unstage it. Type `p` on a file to enter `git add -p` and stage specific
hunks in the file.

Use `:Gdiff` on an open file to see what changes have been made to that
file

**customizations**:

* `<leader>gb` maps to `:Gblame<CR>`
* `<leader>gs` maps to `:Gstatus<CR>`
* `<leader>gd` maps to `:Gdiff<CR>`
* `<leader>gl` maps to `:Glog<CR>`
* `<leader>gc` maps to `:Gcommit<CR>`
* `<leader>gp` maps to `:Git push<CR>`

## [Git Gutter](http://github.com/airblade/vim-gitgutter)

A Vim plugin which shows a git diff in the 'gutter' (sign column). It
shows whether each line has been added, modified, and where lines have
been removed. You can also stage and revert individual hunks.

## [ZoomWin](http://github.com/vim-scripts/ZoomWin)

When working with split windows, ZoomWin lets you zoom into a window and
out again using `Ctrl-W o`

**Customizations**: Janus binds `<leader>zw` to `:ZoomWin`

## [JSON](https://github.com/elzr/vim-json)

Better JSON and JSONP with distinct highlighting for keywords versus
values, strings colored differently from numbers and booleans and double
quotes concealed (disable with `let g:vim_json_syntax_conceal = 0` in
`~/.vimrc.after`, folding of {...} and [...] blocks (enable with
`:setlocal foldmethod=syntax`, and JSON-specific warnings highlighted in
red.

## [BufferGator](https://github.com/jeetsukumaran/vim-buffergator)

Buffergator is a plugin for listing, navigating between, and selecting
buffers to edit. Upon invocation (using the command, `:BuffergatorOpen`
or `BuffergatorToggle`, or the provided key mapping, `<Leader>b`), a
`catalog` of listed buffers are displayed in a separate new window split
(vertical or horizontal, based on user options; default = vertical).
From this "buffer catalog", a buffer can be selected and opened in an
existing window, a new window split (vertical or horizontal), or a new
tab page.

Selected buffers can be "previewed", i.e. opened in a window or tab
page, but with focus remaining in the buffer catalog. Even better, you
can "walk" up and down the list of buffers shown in the catalog by using
`<C-N>` (or `<SPACE>`) / `<C-P>` (or `<C-SPACE>`). These keys select the
next/previous buffer in succession, respectively, opening it for preview
without leaving the buffer catalog viewer.

## [vim-test](https://github.com/janko-m/vim-test)

Imagine you're hacking on a Rails controller, when you switch to the
test or specs for the controller, you can use `t Ctrl+f` to run all the
specs or `t Ctrl+n` to run the closest spec, then you can jump back to
the controller hack on it and use `t Ctrl+l` to run the last spec you
ran last time, so you don't need to open the test again.

All key bindings for vim-test:

`t Ctrl+n` run the current test

`t Ctrl+f` run the current whole test file

`t Ctrl+l` run the last test

`t Ctrl+s` run the whole test suite

`t Ctrl+g` go to the last test file

## [file-line](https://github.com/bogado/file-line)

`:e file.rb:80` open file.rb and jump to line 80

## [abolish-vim](https://github.com/tpope/vim-abolish)

In normal mode: place cursor in front of a word
```
hello_there
^--- cursor here
```
Then

```
crc => helloThere
cru => HELLO_THERE
crs => hello_there
cr- => hello-there
cr<space>  => hello there
crt  => Hello There
```

## [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
Out of the box, all you need to know is a single key `Ctrl-n`. Pressing the key
in Normal mode highlights the current word under the cursor in Visual mode and
places a virtual cursor at the end of it. Pressing it again finds the next
occurrence and places another virtual cursor at the end of the visual selection.
If you select multiple lines in Visual mode, pressing the key puts a virtual
cursor at every line and leaves you in Normal mode.

More at [QuickStart](https://github.com/terryma/vim-multiple-cursors/blob/master/README.md#quick-start)

## [vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace)
This plugin causes all trailing whitespace to be highlighted in red.

To fix the whitespace errors, just call :FixWhitespace.  By default it
operates on the entire file.  Pass a range (or use V to select some lines)
to restrict the portion of the file that gets fixed.

## Additional Syntaxes

Janus ships with a few additional syntaxes:

* Markdown (bound to \*.markdown, \*.md, and \*.mk)
* Markdown auto styling (disabled by setting
  `g:disable_markdown_autostyle` in `~/.vimrc.before` => `let
  g:disable_markdown_autostyle = 1`)
* Mustache (bound to \*.mustache)
* Haml (bound to \*.haml)
* Sass (bound to \*.sass)
* SCSS (bound to \*.scss)
* An improved JavaScript syntax (bound to \*.js)
* Javascript for any file having `nodejs` in the shebang.
* Map Gemfile, Rakefile, Vagrantfile, Procfile, Thorfile, config.ru and
  *.rake to Ruby.
* Git commits (set your `EDITOR` to `vim -f` or  `mvim -f` on OSX)
  `$ echo "export EDITOR='vim -f'" >> ~/.bashrc`, you can also use Git
  global config to set this if you have EDITOR set to something else
  `$ git config --global core.editor 'vim -f'`

## VIM clipboard on OSX
If you use `:version` in your VIM and see `-xterm_clipboard`, your VIM
should work correctly with clipboard (OSX). If not, you will need to use
brew to install your VIM so that it will have `-xterm_clipboard` in its
`:version` to work correctly with clipboard.

## tmux prefix

Ctrl+B can lead to unwanted right mouse click trigger on laptop. So in
this customization we use backtick as the prefix. To type backtick
simply press backtick twice

## git hooks

This distribution come with default global github that will warn you
about these patterns in your code:

```
console.debug
console.warn
console.log
byebug
debugger
```

### tig

Tig is an awesome tools so you can stage your changes in a terminal
This distribution create a shared .tigrc that allow you to:
  1. press `a` in status view to amend the current commit
  2. press `p` in status view to push the current branch to origin
  3. press `D` in status view to delete selected file
# License

### This code is free to use under the terms of the MIT license.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
