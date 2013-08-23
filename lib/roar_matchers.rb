$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'roar_matchers/version'
require 'roar_matchers/support'
require 'roar_matchers/have_links'
require 'roar_matchers/have_properties'
require 'roar_matchers/have_collections'

module Roar
  module Matchers
  end
end
