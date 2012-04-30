Gem::Specification.new do |s|
  s.name      = 'roy-lang'
  s.version   = '0.1'
  s.date      = '2012-04-26'

  s.homepage    = "http://github.com/tmcgilchrist/ruby-roy"
  s.summary     = "Ruby Roy Compiler"
  s.description = <<-EOS
    Ruby Roy is a bridge to the Roy JS compiler.
  EOS

  s.files = [
             'lib/roy-lang.rb',
             'lib/roy_lang.rb',
             'lib/bundled-roy.js',
             'lib/source.rb',
             'LICENSE',
             'README.md'
  ]

  s.add_dependency 'execjs'

  s.authors = ['Tim McGilchrist']
  s.email   = 'timmcgil@gmail.com'
end
