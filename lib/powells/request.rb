require 'excon'
require 'powells/response'

module Powells
  class Request
    # The current API version
    #
    # See http://api.powells.com/stable
    STABLE_API_VERSION = 'v0c'.freeze

    # Create a new request
    def initialize(api_key: ENV['POWELLS_API_KEY'], api_version: STABLE_API_VERSION)
      @api_key = api_key
      @api_version = api_version
    end

    # Retrieve inventory data for a particular ISBN or SKU
    def inventory(isbn_or_sku)
      get('inventory', isbn_or_sku)
    end

    # Retrieve product data for a particular ISBN or SKU
    def product(isbn_or_sku)
      get('product', isbn_or_sku)
    end

    # Retrieve content about an ISBN or SKU
    #
    # This can include items like reviews and publisher descriptions.
    def content(isbn_or_sku)
      get('content', isbn_or_sku)
    end

    # Retrieve information about retail locations
    def locations(slug = nil)
      get('locations', slug)
    end

    # Retrieve product information by way of keywords
    def search(keywords, options = {})
      get('search', URI.encode(keywords), options: options)
    end

    # Retrieve product information for related products
    def recommendation(isbn, options = {})
      get('recommendation', isbn, options: options)
    end

    # A list of up to 50 of the bestselling titles from Powells's Portland
    # locations, sorted most popular first
    def pdxbestsellers(options = {})
      get('pdxbestsellers', options: options)
    end

    # This feed is what Powell's will use to communicate any known issues with
    # particular API calls or the API in general
    def apistatus
      get('apistatus')
    end

    # Switch to development environment
    def sandbox
      @api_key = 'testing'
      self
    end

    # Debug requests
    def debug
      @debug = true
      self
    end

    private

    def get(*query, options: {})
      path = build_path(query)
      options.update(debug: 1) if @debug
      res = http.get(path: path, query: options)

      Response.new(res)
    end

    def http
      Excon.new('http://api.powells.com', expects: 200)
    end

    def build_path(ary)
      [@api_version, @api_key].concat(ary).compact.join('/')
    end
  end
end
