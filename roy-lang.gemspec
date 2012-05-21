Gem::Specification.new do |s|
  s.name        = 'roy-lang'
  s.version     = '0.0.2'
  s.homepage    = "http://github.com/tmcgilchrist/ruby-roy"
  s.summary     = "Ruby Roy Compiler"

  s.author      = 'Tim McGilchrist'
  s.email       = 'timmcgil@gmail.com'

  s.description = "Ruby Roy is a bridge to the Roy JS compiler."

  s.add_runtime_dependency 'execjs', '~> 1.3'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
