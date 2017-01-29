require "pry"

class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    self.total = 0
    self.discount = discount
    self.items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    quantity.times do
      self.items << title
    end
    self.last_transaction = {
      title: title,
      price: price,
      quantity: quantity
    }
  end

  def apply_discount
    if self.discount != 0
      self.total = self.total / 100 * (100 - self.discount)
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    if self.last_transaction.keys.size > 0
      self.total -= self.last_transaction[:price] * self.last_transaction[:quantity]
      self.last_transaction[:quantity].times do
        self.items.pop
      end
      self.last_transaction.clear
    end
  end
end
