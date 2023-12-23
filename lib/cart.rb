class Cart
  attr_reader :products, :amount

  def initialize
    @products = []
    @amount = 0
  end

  def add_to_cart(product)
    if product.quantity.zero?
      quantity_error(product)
    else
      product.quantity -= 1
      @products << product
      successful_add(product)
      cart_sum(product)
    end
  end

  def quantity_error(product)
    puts "Sorry, but we don't have any more #{product}"
  end

  def successful_add(product)
    puts "You choose #{product}"
  end

  def cart_sum(product)
    @amount += product.price
    puts "Total amount: #{amount} $"
  end
end
