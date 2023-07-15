require_relative 'product'
require_relative 'film'
require_relative 'book'

leon = Product.new("Фильм Леон", 290, 5)

puts "#{leon.product_name} стоит #{leon.price} рублей"
