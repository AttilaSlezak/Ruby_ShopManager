require 'test/unit'
require '../Shop/milk'

class MyTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_get_cubic_capacity
    test_milk = Milk.new(101, Milk.LITER, 'Plain Milk inc.', Date.strptime('2017-01-01', '%Y-%m-%d'), 2.8)
    assert_equal(1000, test_milk.cubic_capacity)
  end

  def test_get_producer
    test_milk = Milk.new(101, 1000, 'Plain Milk inc.', Date.strptime('2017-01-01', '%Y-%m-%d'), 2.8)
    assert_equal('Plain Milk inc.', test_milk.producer)
  end

  def test_get_best_before
    test_milk = Milk.new(101, 1000, 'Plain Milk inc.', Date.strptime('2017-01-01', '%Y-%m-%d'), 2.8)
    assert_equal(Date.strptime('2017-01-01', '%Y-%m-%d'), test_milk.best_before)
  end

  def test_get_fat_content
    test_milk = Milk.new(101, 1000, 'Plain Milk inc.', Date.strptime('2017-01-01', '%Y-%m-%d'), 2.8)
    assert_equal(2.8, test_milk.fat_content)
  end

  def test_get_price
    test_milk = Milk.new(101, 1000, 'Plain Milk inc.', Date.strptime('2017-01-01', '%Y-%m-%d'), 2.8)
    assert_equal(210, test_milk.price)
  end

  def test_incorrect_data_to_initialize_milk
    assert_raise ArgumentError do
      Milk.new(101, 1000, 'Plain Milk inc.', Date.strptime('2017-01-01', '%Y-%m-%d'), 28)
    end
  end

  def test_is_milk_still_under_guarantee
    test_date = Date.today + 1
    test_milk = Milk.new(101, 1000, 'Plain Milk inc.', test_date, 2.8)
    assert_equal(true, test_milk.check_still_under_guarantee)
  end

  def test_str_method
    test_milk = Milk.new(101, 1000, 'Plain Milk inc.', Date.strptime('2017-01-01', '%Y-%m-%d'), 2.8)
    assert_equal('Milk{bar code: 101, cubic capacity: 1000 ml, producer: \'Plain Milk inc.\', best before: 2017-01-01' +
     ', fatContent: 2.8}', test_milk.to_s)
  end
end