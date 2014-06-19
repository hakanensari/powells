require 'forwardable'
require 'powells/request'

module Powells
  class << self
    extend Forwardable

    def_delegator Request, :new
  end
end
