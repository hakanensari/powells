require_relative 'helper'

class TestPowells < Minitest::Unit::TestCase
  def setup
    VCR.insert_cassette('powells')
    @powells = Powells.new.sandbox
  end

  def teardown
    VCR.eject_cassette
  end

  def test_inventory_isbn
    res = @powells.inventory('9780590353427')
    refute_empty res.to_h
  end

  def test_inventory_sku
    res = @powells.inventory('17-9780590353427-80')
    refute_empty res.to_h
  end

  def test_product_isbn
    res = @powells.product('9780590353427')
    refute_empty res.to_h
  end

  def test_product_sku
    res = @powells.product('17-9780590353427-80')
    refute_empty res.to_h
  end

  def test_content_isbn
    res = @powells.content('9780590353427')
    refute_empty res.to_h
  end

  def test_content_sku
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
    skip('Powells is not returning JSON')
    res = @powells.apistatus
    refute_empty res.to_h
  end
end
