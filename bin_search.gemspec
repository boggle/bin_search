# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'bin_search/version'

Gem::Specification.new do |s|
  s.name        = 'bin_search'
  s.version     = ::BinSearch::VERSION
  s.summary     = 'Binary search in sorted arrays'
  s.description = 'Pure ruby implementation of binary search for Ruby arrays and similiar data ' +
                  'structures.  Supports ascending and descending sort order, searching ' +
                  'for exact and nearest matches, and has a versatile API.  Uses linear search ' +
                  'for small arrays to make use of the internal cache of moden CPUs.'
  s.author      = 'Stefan Plantikow'
  s.email       = 'stefan.plantikow@googlemail.com'
  s.homepage    = 'https://github.com/boggle/bin_search'
  s.rubyforge_project = 'bin_search'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.bindir      = 'script'
  s.executables = `git ls-files -- script/*`.split("\n").map{ |f| File.basename(f) }
  s.licenses = ['PUBLIC DOMAIN WITHOUT ANY WARRANTY']

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'yard'

  case RUBY_ENGINE.to_sym
    when :jruby then s.add_development_dependency 'maruku'
    else s.add_development_dependency 'redcarpet'
  end
end
