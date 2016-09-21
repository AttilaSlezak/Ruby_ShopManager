
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
    @milk_counter.length > 0
  end

  def fill_up_milk_counter(milk)
    unless milk.is_a? Milk then return false end

    shop_reg = @milk_counter[milk.bar_code]
    if shop_reg.nil?
      shop_reg = ShopRegistration.new(milk, 1, 100)
      @milk_counter[milk.bar_code] = shop_reg
    else
      shop_reg.add_quantity(1)
    end
  end

  def buy_milk(bar_code)
    shop_reg = @milk_counter[bar_code]
    unless shop_reg.nil?
      shop_reg.subtract_quantity(1)
      return shop_reg.milk
    end
    return nil
  end

  class ShopRegistration

    attr_reader :milk, :quantity, :price

    def initialize(milk, quantity, price)
      raise ArgumentError, 'Given data cannot represent a real ShopRegistration!' \
        unless ShopRegistration.check_data_can_represent_real_shop_registration(milk, quantity, price)

      @milk = milk
      @quantity = quantity
      @price = price
    end

    def self.check_data_can_represent_real_shop_registration(milk, quantity, price)
      if !(milk.is_a? Milk)
        puts "'milk' must be Milk type!"
        return false
      elsif !(quantity.is_a? Integer)
        puts "'quantity' must be integer type!"
        return false
      elsif !(price.is_a? Integer)
        puts "'price' must be integer type!"
        return false
      end
      return true
    end

    def milk=(milk)
      if !(milk.is_a? Milk) then return false end
      @milk = milk
    end

    def quantity=(quantity)
      if !(quantity.is_a? Integer) then return false end
      @quantity = quantity
    end

    def price=(price)
      if !(price.is_a? Integer) then return false end
      @price = price
    end

    def add_quantity(quantity)
      @quantity += quantity
    end

    def subtract_quantity(quantity)
      @quantity -= quantity
    end
  end
  private_constant :ShopRegistration
end