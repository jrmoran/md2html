#-*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "md2html/version"

Gem::Specification.new do |s|
  s.name        = "md2html"
  s.version     = Md2html::VERSION
  s.authors     = ["jrmoran"]
  s.homepage    = 'https://github.com/jrmoran/md2html'
  s.summary     = 'Markdown to HTML'
  s.description = 'Converts markdown to styled html with code highlighting'

  s.add_dependency 'hpricot'
  s.add_dependency 'rdiscount'

  s.add_development_dependency 'yui-compressor'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
