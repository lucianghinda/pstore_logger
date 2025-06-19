# frozen_string_literal: true

require_relative 'lib/pstore/version'

Gem::Specification.new do |spec|
  spec.name          = 'pstore_logger'
  spec.version       = PStore::VERSION
  spec.authors       = ['Lucian']
  spec.email         = ['lucian@shortruby.com']

  spec.summary       = 'A simple logging gem using PStore to store data'
  spec.description   = 'The PStore Logger provides a simple way to log webhooks' \
                       "or API responses to a file for further inspection using Ruby's PStore."
  spec.license       = 'MIT'
  spec.files         = Dir['lib/**/*', 'README.md', 'LICENSE']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 3.4.4'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
