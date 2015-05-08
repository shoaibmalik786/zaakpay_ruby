# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zaakpay_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "zaakpay_ruby"
  spec.version       = ZaakpayRuby::VERSION
  spec.authors       = ["Shoaib Malik"]
  spec.email         = ["shoaib2109@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{Zaakpay payment gateway gem for ruby}
  spec.description   = %q{zaakpay_ruby is a ruby gem that demonstrates the integration of a ruby-on-rails application with Zaakpay's api.
                        A payment Gateway gem with easy installation and integration with rails 3, 4
                        -Payment Gateway Services.
                        -More than you want payment options with.
                        -major credit cards, debit cards and 52 netbanking banks.
                        -Fastest Merchant Approval.
                        -Smooth integration across 22 platforms.
                        -Start in minutes.
                        -Multi-Currency Processing Service with 13 currencies.}
  spec.homepage      = "https://github.com/shoaibmalik786/zaakpay_ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
