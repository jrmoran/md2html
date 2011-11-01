# Markdown to HTML

I usualy keep a `log.md` file to document every project. This file is
then converted to HTML. This script automates the process.

## Installation

    gem install md2html

## Usage

    md2html log.md

This will create a `log.html` file.

![Screenshot]( http://i.imgur.com/1Op0n.png )

## Modifiying The Layout
Layout files are in the `html` folder, when making changes to any `css`
or `js` file, run `rake layout` to build a minified version of the layout.


## Credits
This project uses

* [Twitter's CSS Bootstrap](http://twitter.github.com/bootstrap) 
* [Google's Code Prettify](http://code.google.com/p/google-code-prettify/)
* [Rdiscount](https://github.com/rtomayko/rdiscount)
* [Hpricot](https://github.com/hpricot/hpricot)
* [Ruby-YUI Compressor](https://github.com/sstephenson/ruby-yui-compressor)
