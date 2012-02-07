# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "html_to_markdown/version"

Gem::Specification.new do |s|
  s.name        = "html_to_markdown"
  s.version     = HtmlToMarkdown::VERSION
  s.authors     = ["David Santoro", "Federico Rebora", "Ken Alex Fassone"]
  s.email       = ["soulnafein@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "html_to_markdown"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_development_dependency "rake"
  s.add_development_dependency "turn"
  s.add_development_dependency "ansi"
  s.add_development_dependency "minitest"
  s.add_runtime_dependency "nokogiri"
end
