require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'

leon = Product.new("Фильм Леон", 290, 5)

puts "#{leon.name} стоит #{leon.price} рублей"
