require 'test_helper'

class ZillashopTest < ActiveSupport::TestCase
  test "sanity" do
    assert_nothing_raised do
      ZillaShop.new
    end
  end
end
