# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hydra-fixtures/version"
require 'bundler'

Gem::Specification.new do |s|
  s.name        = "hydra-fixtures"
  s.version     = GEMVERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Bess Sadler"]
  s.email       = ["bess@stanford.edu"]
  s.homepage    = "https://github.com/projecthydra/hydra-fixtures"
  s.summary     = %q{Load, delete and refresh the fixtures used by hydra for testing.}
  s.description = %q{This gem contains the union set of all of the hydra testing fixtures from hydrangea, libra and hydrus. It also contains methods and rake tasks for loading them, refreshing them, and cleaning them in hydra-jetty.}
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  # s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.required_rubygems_version = ">= 1.3.6"
  
  s.add_dependency "nokogiri"
  s.add_dependency "active-fedora"
  
  # Bundler will install these gems too if you've checked this out from source from git and run 'bundle install'
  # It will not add these as dependencies if you require lyber-core for other projects
  s.add_development_dependency "ruby-debug"
  s.add_development_dependency "ruby-debug-base"
  s.add_development_dependency "rspec", "< 2.0" # We're not ready to upgrade to rspec 2
  s.add_development_dependency 'rspec-rails', '<2.0.0' # rspec-rails 2.0.0 requires Rails 3.
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'rcov'
  
  s.add_development_dependency 'yard', '0.6.5'  # Yard > 0.6.5 won't generate docs.
                                                # I don't know why & don't have time to 
                                                # debug it right now
  
  s.add_development_dependency 'RedCloth'
  
end

