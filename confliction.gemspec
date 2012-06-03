# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "confliction/version"

Gem::Specification.new do |s|
  s.name        = "confliction"
  s.version     = Confliction::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Narihiro Nakamura"]
  s.email       = ["authornari@gmail.com"]
  s.homepage    = "https://github.com/authorNari/confliction"
  s.summary     = %q{YAML config loader with checking conflict from example}
  s.description = %q{YAML config loader with checking conflict from example}

  s.rubyforge_project = "confliction"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
