require 'bundler/setup'
Bundler.require(:default)

require 'roar_matchers'
require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

require_relative './fixtures/country'
require_relative './fixtures/state'
require_relative './fixtures/state_representer'
require_relative './fixtures/country_representer'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = "random"
end
