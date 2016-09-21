require 'test/unit'
require '../Shop/milk'
require '../Shop/shop'

class MyTest < Test::Unit::TestCase

  def setup
    @test_shop = Shop.new('Food Store', '101st Corner Street', 'George Warren')
    @test_milk = Milk.new(101, Milk::LITER, 'Plain Milk inc.', Date.today + 1, Milk::WHOLE_MILK)
  end

  def teardown
    @test_shop = nil
    @test_milk = nil
  end

  def test_get_name
    assert_equal('Food Store', @test_shop.name)
  end

  def test_get_address
    assert_equal('101st Corner Street', @test_shop.address)
  end

  def test_get_owner
    assert_equal('George Warren', @test_shop.owner)
  end

  def test_is_there_any_milk_if_not
    assert_false(@test_shop.is_there_any_milk)
  end

  def test_is_there_any_milk_if_yes
    @test_shop.replenish_milk_counter(@test_milk)
    assert_true(@test_shop.is_there_any_milk)
  end

  def test_replenish_milk_counter
    @test_shop.replenish_milk_counter(@test_milk)
    assert_true(@test_shop.is_there_any_milk)
  end

  def test_buy_milk
    @test_shop.replenish_milk_counter(@test_milk)
    assert_equal(@test_milk, @test_shop.buy_milk(101))
  end
end