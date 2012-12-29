# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'img2base64/version'

Gem::Specification.new do |gem|
  gem.name          = "img2base64"
  gem.version       = Img2Base64::VERSION
  gem.authors       = ["Tate Johnson"]
  gem.email         = ["tate@tatey.com"]
  gem.description   = %q{Convert image to base64 encoded string}
  gem.summary       = %q{Convert image to base64 encoded string}
  gem.homepage      = "https://github.com/tatey/img2base64"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
