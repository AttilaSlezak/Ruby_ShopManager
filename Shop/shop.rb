
class Shop

  attr_reader :name, :address, :owner

  def initialize(name, address, owner, milk_counter = {})
    raise ArgumentError, 'Given data cannot represent a real Shop!' \
      unless Shop.check_data_represent_real_shop(name, address, owner, milk_counter)

    @name = name
    @address = address
    @owner = owner
    @milk_counter = milk_counter
  end

  def self.check_data_represent_real_shop(name, address, owner, milk_counter)
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

  def is_there_any_milk
    @milk_counter.length > 0
  end

  def replenish_milk_counter(milk)
    return false unless milk.is_a? Milk

    shop_reg = @milk_counter[milk.barcode]
    if shop_reg.nil?
      shop_reg = ShopRegister.new(milk, 1, 100)
      @milk_counter[milk.barcode] = shop_reg
    else
      shop_reg.add_quantity(1)
    end
  end

  def buy_milk(barcode)
    shop_reg = @milk_counter[barcode]
    unless shop_reg.nil?
      shop_reg.subtract_quantity(1)
      return shop_reg.milk
    end
    nil
  end

  class ShopRegister

    attr_reader :milk, :quantity, :price

    def initialize(milk, quantity, price)
      raise ArgumentError, 'Given data cannot represent a real ShopRegistration!' \
        unless ShopRegister.check_data_represent_real_shop_register(milk, quantity, price)

      @milk = milk
      @quantity = quantity
      @price = price
    end

    def self.check_data_represent_real_shop_register(milk, quantity, price)
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
      return false unless milk.is_a? Milk
      @milk = milk
    end

    def quantity=(quantity)
      return false unless quantity.is_a? Integer
      @quantity = quantity
    end

    def price=(price)
      return false unless price.is_a? Integer
      @price = price
    end

    def add_quantity(quantity)
      @quantity += quantity
    end

    def subtract_quantity(quantity)
      @quantity -= quantity
    end
  end
  private_constant :ShopRegister
end