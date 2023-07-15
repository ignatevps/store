require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'

leon = Product.new(name: "Фильм Леон", price: 290, quantity: 10)

puts "#{leon.name} стоит #{leon.price} рублей. Наличие: #{leon.quantity} шт."
