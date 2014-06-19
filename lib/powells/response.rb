require 'delegate'
require 'json'

module Powells
  class Response < SimpleDelegator
    def to_h
      JSON.parse(body)
    end
  end
end
