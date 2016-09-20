require 'test/unit'
require '../Shop/milk'

class MyTest < Test::Unit::TestCase

  @@test_milk = nil
  @@test_date = Date.today + 1

  def setup
    @@test_milk = Milk.new(101, Milk::LITER, 'Plain Milk inc.', @@test_date, Milk::WHOLE_MILK)
  end

  def teardown
    @@test_milk = nil
  end

  def test_get_cubic_capacity
    assert_equal(1000, @@test_milk.cubic_capacity)
  end

  def test_get_producer
    assert_equal('Plain Milk inc.', @@test_milk.producer)
  end

  def test_get_best_before
    assert_equal(@@test_date, @@test_milk.best_before)
  end

  def test_get_fat_content
    assert_equal(2.8, @@test_milk.fat_content)
  end

  def test_incorrect_data_to_initialize_milk
    assert_raise ArgumentError do
      Milk.new(101, Milk::LITER, 'Plain Milk inc.', Date.strptime('2017-01-01', '%Y-%m-%d'), 28)
    end
  end

  def test_is_milk_still_under_guarantee
    assert_equal(true, @@test_milk.check_still_under_guarantee)
  end

  def test_str_method
    assert_equal('Milk{bar code: 101, cubic capacity: 1000 ml, producer: \'Plain Milk inc.\', best before: ' +
      @@test_date.to_s + ', fat content: 2.8}', @@test_milk.to_s)
  end
end