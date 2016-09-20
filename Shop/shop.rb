
class Shop

  attr_reader :name, :address, :owner

  def initialize(name, address, owner, milk_counter = {})
    raise ArgumentError, 'Given data cannot represent a real Shop!' \
      unless Shop.check_data_can_represent_real_shop(name, address, owner, milk_counter)

    @name = name
    @address = address
    @owner = owner
    @milk_counter = milk_counter
  end

  def self.check_data_can_represent_real_shop(name, address, owner, milk_counter)
    if !(name.is_a? String)
      puts "'name' must be string type!"
      return false
    elsif !(address.is_a? String)
      puts "'address' must be string type!"
      return false
    elsif !(owner.is_a? String)
      puts "'owner' must be string type!"
      return false
    elsif !(milk_counter.is_a? Hash)
      puts "'milk_counter' must be hash type!"
      return false
    end
    return true
  end

  def is_there_any_milk()
    @milk_counter.lenth > 0
  end

  def fill_up_milk_counter(milk)
    if !(milk.is_a? Milk) then return false end
    @milk_counter[milk.bar_code] = milk
  end

  def buy_milk(bar_code)
    return @milk_counter.delete(bar_code)
  end
end