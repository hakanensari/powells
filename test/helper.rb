require 'minitest/autorun'
require 'pry'
require 'vcr'

require_relative '../lib/powells'

VCR.configure do |c|
  c.hook_into :excon
  c.cassette_library_dir = 'test/vcr_cassettes'
  c.default_cassette_options = { record: :new_episodes }
  c.filter_sensitive_data('<API_KEY>') { ENV['POWELLS_API_KEY'] }
end
