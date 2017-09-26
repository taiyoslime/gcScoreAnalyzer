# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'groove/version'

Gem::Specification.new do |spec|
  spec.name          = "groove"
  spec.version       = Groove::VERSION
  spec.authors       = ["taiyoslime"]
  spec.email         = ["contact.taiyoslime@gmail.com"]

  spec.summary       = %q{A score analyzing tool for GROOVE COASTER 3}
  spec.description   = %q{A score analyzing tool for GROOVE COASTER 3, which is one of the arcade rhythm games in Japan. It is written in Ruby language. }
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "mechanize"
  spec.add_development_dependency "rmagick"
  # spec.add_development_dependency "lambda_driver"
  # spec.add_development_dependency "hash_mapper"
end
