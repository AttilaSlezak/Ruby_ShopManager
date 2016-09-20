
class Shop

  attr_reader :name, :address, :owner

  def initialize(name, address, owner, milk_counter)
    raise ArgumentError, 'Given data cannot represent a real Shop!' \
      unless Shop.check_data_can_represent_real_shop(name, address, owner, milk_counter)

    @name = name
    @address = address
    @owner = owner
    @milk_counter = milk_counter
    @flag = milk_counter.length - 1
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
    elsif !(milk_counter.is_a? Array)
      puts "'milk_counter' must be array type!"
      return false
    end
    return true
  end

  def is_there_any_milk()
    @milk_counter.lenth > 0
  end

  def buy_milk(milk)
    @flag -= 1
    @milk_counter[@flag + 1]
  end
end