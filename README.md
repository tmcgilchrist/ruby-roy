Ruby Roy [![Build Status](https://travis-ci.org/tmcgilchrist/ruby-roy.png?branch=master)](https://travis-ci.org/tmcgilchrist/ruby-roy)
==================

Ruby Roy is a bridge to the offical Roy compiler.

    Roy.compile File.read("script.roy")

Installation
------------------

    gem install roy-lang

Dependencies
------------------

This library includes a copy of the Roy source code, updated as each offical
version of Roy is released.


### JSON

The `json` library is also required but is not explicitly stated as a
gem dependency. If you're on Ruby 1.8 you'll need to install the
`json` or `json_pure` gem. On Ruby 1.9, `json` is included in the
standard library.

### ExecJS

The [ExecJS](https://github.com/sstephenson/execjs) library is used to automatically choose the best JavaScript engine for your platform. Check out its [README](https://github.com/sstephenson/execjs/blob/master/README.md) for a complete list of supported engines.
