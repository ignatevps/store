require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'
require_relative 'lib/music'
require_relative 'lib/collection'
require_relative 'lib/cart'

# creating a collection of products
collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

# sorting
collection.sort!(by: :price, order: :asc)

cart = Cart.new

user_input = nil
while user_input != 0
  puts 'What would you like to buy?'

  # get an array of products using the to_a method and
  # display each one on the screen
  collection.to_a.each_with_index do |product, i|
    puts "#{i + 1}. #{product}"
  end
  puts '0. Exit'

  user_input = STDIN.gets.to_i

  if user_input.positive? && user_input <= collection.to_a.size + 1
    cart.add_to_cart(collection.to_a[user_input - 1])
  end
end

puts 'You bought:'
cart.products.each do |product|
  puts product
end

puts "Total amount: #{cart.amount} $. Thanks!"
