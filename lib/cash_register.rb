require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @transaction = []
  end

  def add_item(name, price, quantity = 1)
    item_info = {}
    item_info[:name] = name
    item_info[:price] = price
    item_info[:quantity] = quantity

    @items << item_info

    @total += (price * quantity)
    @transaction << (item_info[:price] * item_info[:quantity])
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total *= 0.8
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    items_by_quantity = []

    @items.each do |item_info|
      for quantity in 1..item_info[:quantity]
        items_by_quantity << item_info[:name]
      end
    end

    items_by_quantity
  end

  def void_last_transaction
    @total -= @transaction[-1]
  end
  # binding.pry

end
