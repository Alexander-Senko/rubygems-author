# `Gem::Author`

![GitHub Actions Workflow Status](
	https://img.shields.io/github/actions/workflow/status/Alexander-Senko/rubygems-author/ci.yml
)
![Code Climate maintainability](
	https://img.shields.io/codeclimate/maintainability-percentage/Alexander-Senko/rubygems-author
)
![Code Climate coverage](
	https://img.shields.io/codeclimate/coverage/Alexander-Senko/rubygems-author
)

It holds authors info to be used primarily in gem specs.

## Installation

Install the gem by executing:

```bash
gem install rubygems-author
```

> [!IMPORTANT]
> No way to install `Gem::Author` with Bundler is yet found when it’s used in a gemspec.

## Usage

1. Inherit `Gem::Author` inside your gem and add the authors’ info.

	```ruby
	require 'rubygems/author'
	
	module MyLib
	  class Author < Gem::Author
	    new(
	      name:   'Your Name',
	      email:  'Your.Name@email.service',
	      github: 'Your-GitHub-Username',
	    )
	  end
	end
	```

2. You can call some helper methods now.

	```ruby
	Gem::Specification.new do |spec|
	  spec.name     = 'my_lib'
	  spec.version  = MyLib::VERSION
	  spec.authors  = MyLib::Author.names
	  spec.email    = MyLib::Author.emails
	  spec.homepage = "#{MyLib::Author.github_url}/#{spec.name}"
	end
	```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Alexander-Senko/rubygems-author. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Alexander-Senko/rubygems-author/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Gem::Author project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Alexander-Senko/rubygems-author/blob/main/CODE_OF_CONDUCT.md).
