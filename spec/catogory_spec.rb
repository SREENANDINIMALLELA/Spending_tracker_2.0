require 'minitest/autorun'
require_relative '../models/category.rb'

class TestCategory < Minitest::Test

  def test_add
    assert_equal( 6, Category.all() )
  end


end
