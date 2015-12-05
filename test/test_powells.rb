require_relative 'helper'

class TestPowells < Minitest::Unit::TestCase
  def setup
    VCR.insert_cassette('powells')
    @powells = Powells.new
  end

  def teardown
    VCR.eject_cassette
  end

  def test_inventory_isbn
    res = @powells.inventory('9781501107832')
    refute_empty res.to_h
  end

  def test_inventory_sku
    skip('No longer implemented?')
    res = @powells.inventory('17-9780590353427-80')
    refute_empty res.to_h
  end

  def test_product_isbn
    res = @powells.product('9781501107832')
    refute_empty res.to_h
  end

  def test_product_sku
    skip('No longer implemented?')
    res = @powells.product('17-9780590353427-80')
    refute_empty res.to_h
  end

  def test_content_isbn
    res = @powells.content('9780590353427')
    refute_empty res.to_h
  end

  def test_content_sku
    skip('No longer implemented?')
    res = @powells.content('17-9780590353427-80')
    refute_empty res.to_h
  end

  def test_locations
    res = @powells.locations
    refute_empty res.to_h
  end

  def test_locations_slug
    res = @powells.locations('powells-city-of-books')
    refute_empty res.to_h
  end

  def test_search
    res = @powells.search('harry potter')
    refute_empty res.to_h
  end

  def test_recommendation
    res = @powells.recommendation('9780590353427')
    refute_empty res.to_h
  end

  def test_pdxbestsellers
    res = @powells.pdxbestsellers
    refute_empty res.to_h
  end

  def test_apistatus
    skip('No longer implemented?')
    res = @powells.apistatus
    refute_empty res.to_h
  end

  def test_accepts_options
    res = @powells.search('harry potter', per_page: 20)
    skip('No longer implemented?')
    assert_equal 20, res.to_h['results'].count
  end

  def test_debug
    res = @powells.debug.search('harry potter')
    assert_includes res.to_h.keys, 'input'
  end

  def test_api_key_guard
    assert_raises(ArgumentError) do
      Powells.new(api_key: nil).search('foo')
    end
  end
end
