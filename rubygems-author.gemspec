# frozen_string_literal: true

require_relative 'lib/rubygems/author/version'
require_relative 'lib/rubygems/author/authors'

Gem::Specification.new do |spec|
	spec.name        = 'rubygems-author'
	spec.version     = Gem::Author::VERSION
	spec.authors     = Gem::Author::Author.names
	spec.email       = Gem::Author::Author.emails
	spec.homepage    = "#{Gem::Author::Author.github_url}/#{spec.name}"
	spec.summary     = 'Your gem’s authors abstraction'
	spec.description = 'Gem::Author holds authors info to be used primarily in gem specs.'
	spec.license     = 'MIT'

	spec.metadata['source_code_uri'] = spec.homepage
	spec.metadata['changelog_uri']   = "#{spec.metadata['source_code_uri']}/blob/v#{spec.version}/CHANGELOG.md"

	# Specify which files should be added to the gem when it is released.
	# The `git ls-files -z` loads the files in the RubyGem that have been added into git.
	gemspec    = File.basename(__FILE__)
	spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
		ls.readlines("\x0", chomp: true).reject do |f|
			(f == gemspec) ||
					f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
		end
	end

	spec.required_ruby_version = '~> 3.2'
end
