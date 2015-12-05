require 'delegate'
require 'json'

module Powells
  class Response < SimpleDelegator
    def to_h
      data = JSON.parse(body)
      data.is_a?(Array) ? data.first : data
    end
  end
end
