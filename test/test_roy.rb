require 'roy_lang'
require 'test/unit'
require 'stringio'

class TestRoy < Test::Unit::TestCase
  def test_compile
    expected = "(function() {\nvar add = function(x, y) {\n    return x + y;\n};\n})();\n"
    assert_equal expected, Roy.compile("let add (x:Number) (y:Number) = x + y")
  end

  def test_compile_with_io
    expected = "(function() {\nvar add = function(x, y) {\n    return x + y;\n};\n})();\n"
    io = StringIO.new("let add (x:Number) (y:Number) = x + y")
    assert_equal expected, Roy.compile(io)
  end

  def test_compilation_error
    assert_raise Roy::CompilationError do
      Roy.compile(nil)
    end
  end

  def test_nodejs
    assert_equal "var x = 10;\n", Roy.compile("let x = 10", nodejs: true)
  end

  def test_strict
    assert_equal "(function() {\n\"use strict\";\nvar x = 10;\n})();\n", Roy.compile("let x = 10", strict: true)
  end

  def test_nodejs_strict
    assert_equal "\"use strict\";\nvar x = 10;\n", Roy.compile("let x = 10", strict: true, nodejs: true)
  end

  def test_strict_opts_false
    assert_equal "(function() {\nvar x = 10;\n})();\n", Roy.compile("let x = 10", strict: false, nodejs: false)
  end
end
