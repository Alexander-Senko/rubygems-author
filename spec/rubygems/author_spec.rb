# frozen_string_literal: true

# rubocop:disable RSpec/SpecFilePathFormat
# rubocop:disable Layout/MultilineBlockLayout
# rubocop:disable Layout/BlockEndNewline

module Gem
	RSpec.describe Author do
		let(:john) { {
				name:   'John Smith',
				email:  'john@smith.name',
				github: 'John-Smith',
		} }

		let(:emily) { {
				name:   'Emily Johnson',
				email:  'emily@johnson.name',
				github: 'Emily-Johnson',
		} }

		context 'with a single author' do
			subject do
				Class.new(described_class).tap do
					_1.new **john
				end
			end

			its(:names)      { is_expected.to eq [ 'John Smith'      ] }
			its(:emails)     { is_expected.to eq [ 'john@smith.name' ] }
			its(:github_url) { is_expected.to eq 'https://github.com/John-Smith' }
		end

		context 'with multiple authors' do
			subject do
				Class.new(described_class).tap do
					_1.new **john
					_1.new **emily
				end
			end

			its(:names)      { is_expected.to eq [ 'John Smith',      'Emily Johnson'      ] }
			its(:emails)     { is_expected.to eq [ 'john@smith.name', 'emily@johnson.name' ] }
			its(:github_url) { is_expected.to eq 'https://github.com/John-Smith' }

			context 'with a GutHub account missing' do
				before { john.delete :github }

				its(:github_url) { is_expected.to eq 'https://github.com/Emily-Johnson' }
			end
		end
	end
end
