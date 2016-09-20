require 'date'

class Milk

  attr_reader :bar_code, :producer, :best_before, :fat_content, :cubic_capacity

  LITER = 1000
  HALF_LITER = 500
  GLASS = 200
  WHOLE_MILK = 2.8
  LOW_FAT_MILK = 1.5

  def initialize(bar_code, cubic_capacity, producer, best_before, fat_content)
    raise ArgumentError, 'Given data cannot represent real Milk!' \
      unless Milk.check_data_can_represent_real_milk(bar_code, cubic_capacity, producer, best_before, fat_content)

    @bar_code = bar_code
    @cubic_capacity = cubic_capacity
    @producer = producer
    @best_before = best_before
    @fat_content = fat_content
  end

  def to_s
    'Milk{' + \
      'bar code: ' + @bar_code +
      ', cubic capacity: ' + @cubic_capacity.to_s + ' ml' + \
      ', producer: \'' + @producer + '\'' + \
      ', best before: ' + @best_before.to_s + \
      ', fat content: ' + @fat_content.to_s + '}'
  end

  def self.check_data_can_represent_real_milk(bar_code, cubic_capacity, producer, best_before, fat_content)
    if !(bar_code.is_a? Integer)
      puts "'bar_code' must be integer type"
      return false
    elsif !(cubic_capacity.is_a? Integer)
      puts "'cubic_capacity' must be integer type!"
      return false
    elsif !(producer.is_a? String)
      puts "'producer' must be string type!"
      return false
    elsif !(best_before.is_a? Date)
      puts "'best_before' must be datetime type!"
      return false
    elsif !(fat_content.is_a? Float)
      puts "'fat_content' must be float type!"
      return false
    end
    return true
  end

  def check_still_under_guarantee
    @best_before >= Date.today ? true : false
  end
end
