require 'execjs'
require 'source'

module Roy
  EngineError = ExecJS::RuntimeError
  CompilationError = ExecJS::ProgramError

  module Source
    def self.path
      @path ||= ENV['ROY_SOURCE_PATH'] || bundled_path
    end

    def self.path=(path)
      @contents = @version = @context = nil
      @path = path
    end

    def self.contents
      @contents ||= File.read(path)
    end

    def self.version
      @version ||= contents[/Roy v([\d.]+)/, 1]
    end

    def self.bare_option
      @bare_option ||= contents.match(/noWrap/) ? 'noWrap' : 'bare'
    end

    def self.context
      @context ||= ExecJS.compile(contents)
    end
  end

  class << self
    def engine
    end

    def engine=(engine)
    end

    def version
      Source.version
    end

    # Public: Compile a Roy script to JavaScript.
    #
    # script  - The roy script to compile, must respond to read.
    # options - The options for the roy compiler:
    #           :nodejs - When true assumes nodejs environment, which
    #                     prevents IIFE wrapping and uses exports.
    #           :strict - When true inserts "use strict";
    #
    # Returns a String of JavaScript.
    def compile(script, options = {})
      script = script.read if script.respond_to?(:read)

      # var compile = function(source, env, aliases, opts) { ... }
      Source.context.call("roy.compile", script, {}, {}, options)["output"]
    end
  end
end
