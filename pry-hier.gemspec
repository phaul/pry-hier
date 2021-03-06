Gem::Specification.new do |s|
  s.name        = 'pry-hier'
  s.version     = '0.1.1'
  s.date        = '2019-02-17'
  s.summary     = 'Shows an ascii art tree of the descendants of a class.'
  s.description = <<~EOS
  Given an class or module name hier command shows an ascii tree (similar to
  the tree shell command) of the descendants of the given class.
  EOS
  s.authors     = ['Paul Sonkoly']
  s.email       = 'sonkoly.pal@gmail.com'
  s.files       = ["lib/pry-hier.rb"]
  s.homepage    = 'http://github.com/phaul/pry-hier'
  s.license     = 'MIT'
  s.required_ruby_version = '~> 2.5'
  s.add_runtime_dependency 'pry', '~> 0.12'
  s.add_runtime_dependency 'tty-tree', '~> 0.2'
  s.add_development_dependency 'rspec', '~> 3.8'
end
