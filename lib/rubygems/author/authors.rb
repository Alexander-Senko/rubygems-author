# frozen_string_literal: true

require_relative '../author'

module Gem
	class Author::Author < Author # :nodoc:
		new(
				name:   'Alexander Senko',
				email:  'Alexander.Senko@gmail.com',
				github: 'Alexander-Senko',
		)
	end
end
