require 'date'

class Milk

  attr_reader :producer, :best_before, :fat_content, :price, :cubic_capacity

  def initialize(cubic_capacity, producer, best_before, fat_content, price)
    raise ArgumentError, 'Given data cannot represent real Milk!' \
      unless Milk.check_data_can_represent_real_milk(cubic_capacity, producer, best_before, fat_content, price)

    @cubic_capacity = cubic_capacity
    @producer = producer
    @best_before = best_before
    @fat_content = fat_content
    @price = price
  end

  def to_s
    'Milk{' + \
      'cubicCapacity: ' + @cubic_capacity.to_s + ' ml' + \
      ', producer: \'' + @producer + '\'' + \
      ', bestBefore: ' + @best_before.to_s + \
      ', fatContent: ' + @fat_content.to_s + \
      ', price: ' + @price.to_s + ' forint(s)' + '}'
  end

  def self.check_data_can_represent_real_milk(cubic_capacity, producer, best_before, fat_content, price)
    if !(cubic_capacity.is_a? Integer)
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
    elsif !(price.is_a? Integer)
      puts "'price' must be integer type!"
      return false
    end
    return true
  end

  def check_still_under_guarantee
    @best_before >= Date.today ? true : false
  end

end
