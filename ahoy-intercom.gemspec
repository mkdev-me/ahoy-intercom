# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ahoy/intercom/version"

Gem::Specification.new do |spec|
  spec.name          = "ahoy-intercom"
  spec.version       = Ahoy::Intercom::VERSION
  spec.authors       = ["Kirill Shirinkin", "Oleksandr Ulizko"]
  spec.email         = ["fodojyko@gmail.com", "ulizman@gmail.com"]

  spec.summary       = %q{IntercomStore for ahoy gem.}
  spec.description   = %q{IntercomStore for ahoy gem.}
  spec.homepage      = "https://github.com/mkdev-me/ahoy-intercom"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "intercom", '~> 3.5.17'
  spec.add_dependency "railties"
  spec.add_development_dependency "ahoy_matey"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
