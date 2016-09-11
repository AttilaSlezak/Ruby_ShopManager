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

  def test_incorrect_data_to_initialize_milk
    assert_raise ArgumentError do
      Milk.new(1000, 'Plain Milk inc.', Date.strptime('2017-01-01', '%Y-%m-%d'), 28, 210)
    end
  end

  def test_is_milk_still_under_guarantee
    test_milk = Milk.new(1000, 'Plain Milk inc.', Date.strptime('2017-01-01', '%Y-%m-%d'), 2.8, 210)
    assert_equal(true, test_milk.check_still_under_guarantee)
  end

  def test_str_method
    test_milk = Milk.new(1000, 'Plain Milk inc.', Date.strptime('2017-01-01', '%Y-%m-%d'), 2.8, 210)
    assert_equal('Milk{cubicCapacity: 1000 ml, producer: Plain Milk inc., bestBefore: 2017-01-01' +
     ', fatContent: 2.8, price: 210 forint(s)}', test_milk.to_s)
  end
end