# -*- encoding: utf-8 -*-
require File.expand_path('../lib/html_tagger/version', __FILE__)


Gem::Specification.new do |gem|
  gem.authors       = ["Craig A. Cook"]
  gem.email         = ["craig.a.cook@gmail.com"]
  gem.description   = %q{OO simple html tagging of text, similar to JS calls}
  gem.summary       = %q{generates HTML tags similar to how it is done in JavaScript}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "html_tagger"
  gem.require_paths = ["lib"]
  gem.version       = HtmlTagger::VERSION
  gem.add_development_dependency   "rspec"
end
