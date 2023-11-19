# frozen_string_literal: true

require_relative 'lib/strings-parser/version'

Gem::Specification.new do |spec|
  spec.name = 'strings-parser'
  spec.version = StringsParser::VERSION
  spec.authors = ['Damian Rzeszot']
  spec.email = ['my.fucking.alias@icloud.com']

  spec.summary = ''
  spec.description = ''
  spec.homepage = 'https://github.com/rzeszot/gem-strings-parser/'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/rzeszot/strings-parser-gem/CHANGELOG.md'

  spec.files = Dir['lib/**/*.rb']

  spec.require_paths = ['lib']
end
