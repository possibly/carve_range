# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "carve_range/version"

Gem::Specification.new do |spec|
  spec.name          = "carve_range"
  spec.version       = CarveRange::VERSION
  spec.authors       = ["Tyler Brothers"]
  spec.email         = ["tylerbrothers1@gmail.com"]

  spec.summary       = "Takes two date ranges (A,B) and returns an array of date ranges in A that do not overlap with date range B, and returns B. See the README for more info (https://github.com/possibly/carve_range)"
  spec.description   = "Takes two date ranges (A,B) and returns an array of date ranges in A that do not overlap with date range B, and returns B. See the README for more info (https://github.com/possibly/carve_range)"
  spec.homepage      = "https://github.com/possibly/carve_range"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
