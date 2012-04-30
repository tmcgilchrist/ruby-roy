require 'roy_lang'
require 'test/unit'
require 'stringio'

class TestRoy < Test::Unit::TestCase
  def test_compile
    assert_equal "(function() {\nconsole.log('Hello world');\n})();\n", Roy.compile("console.log 'Hello world'")["output"]
  end

  def test_compile_with_io
    io = StringIO.new("console.log 'Hello, World!'\n")
    assert_equal "(function() {\nconsole.log('Hello, World!');\n})();\n", Roy.compile(io)["output"]
  end

  def test_compilation_error
    assert_raise Roy::CompilationError do
      Roy.compile(nil)
    end
  end
end
