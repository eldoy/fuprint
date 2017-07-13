Gem::Specification.new do |s|
  s.name        = 'fuprint'
  s.version     = '0.1.4'
  s.date        = '2017-07-12'
  s.summary     = "Fuprint Rack request printer middleware"
  s.description = "Rack middleware that prints information about your request to console in development."
  s.authors     = ["Fugroup Limited"]
  s.email       = 'mail@fugroup.net'

  s.homepage    = 'https://github.com/fugroup/fuprint'
  s.license     = 'MIT'

  s.add_runtime_dependency 'rack', '>= 0'
  s.add_development_dependency 'futest', '>= 0'

  s.require_paths = ['lib']
  s.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
end
