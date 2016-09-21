require 'test/unit'
require '../Shop/milk'
require '../Shop/shop'

class MyTest < Test::Unit::TestCase

  @@methods_shop_reg = nil
  @@test_milk = nil
  @@obj_shop_reg = nil

  def setup
    shop =  Shop.new("Food Store", "101st Corner Street", "George Warren")
    @@test_milk = Milk.new(101, Milk::LITER, "Plain Milk inc.", Date.today + 1, Milk::WHOLE_MILK)
    class_shop_reg = Shop.const_get(:ShopRegistration)
    @@obj_shop_reg = class_shop_reg.new(@@test_milk, 3, 100)
    @@methods_shop_reg = @@obj_shop_reg.public_methods
  end

  def teardown
    @@methods_shop_reg = nil
    @@test_milk = nil
    @@obj_shop_reg = nil
    end

  def access_object_in_certain_method(method_name, new_obj=nil)
    @@methods_shop_reg.each do |one|
      if one.to_s == method_name
        if new_obj != nil
          return @@obj_shop_reg.send(one, new_obj)
        else
          return @@obj_shop_reg.send(one)
        end
      end
    end
  end

  def test_get_milk
    milk = access_object_in_certain_method("milk")
    assert_equal(@@test_milk, milk)
  end

  def test_set_milk
    milk = Milk.new(201, Milk::HALF_LITER, "Plain Milk inc.", Date.today, Milk::LOW_FAT_MILK)
    result_milk = access_object_in_certain_method("milk=", milk)
    assert_equal(result_milk, milk)
  end

  def test_get_quantity
    quantity = access_object_in_certain_method("quantity")
    assert_equal(3, quantity)
  end

  def test_set_quantity
    quantity = access_object_in_certain_method("quantity=", 5)
    assert_equal(5, quantity)
  end

  def test_add_quantity
    quantity = access_object_in_certain_method("add_quantity", 5)
    assert_equal(8, quantity)
  end

  def test_subtract_quantity
    quantity = access_object_in_certain_method("subtract_quantity", 2)
    assert_equal(1, quantity)
  end

  def test_get_price
    price = access_object_in_certain_method("price")
    assert_equal(100, price)
  end

  def test_set_price
    result_price = access_object_in_certain_method("price=", 200)
    assert_equal(200, result_price)
  end
end