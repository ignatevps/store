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
while user_input != 0 do
  puts "What would you like to buy?"

  # get an array of products using the to_a method and
  # display each one on the screen
  collection.to_a.each_with_index do |product, i|
    puts "#{i + 1}. #{product}"
  end
  puts "0. Exit"

  user_input = STDIN.gets.to_i

  if user_input > 0 && user_input <= collection.to_a.size + 1
    cart.add_to_cart(collection.to_a[user_input - 1])
  end
end

puts "You bought:"
cart.products.each do |product|
  puts product
end

puts "Total amount: #{cart.amount} $. Thanks!"




# ----------------------
# current_path = File.dirname(__FILE__)
# film = Film.from_file(current_path + '/data/films/01.txt')
# book = Film.from_file(current_path + '/data/books/01.txt')

# puts film
# puts book

# begin
#   Product.from_file(current_path + '/data/films/01.txt')
# rescue NotImplementedError
#   puts 'Method of the class Product.from_file not implemented'
# end

# -----------------------
# puts "We have:"
# puts
# products = []
# products << Book.new(name: "Idiot", price: 20, quantity: 11, genre: "Tragedy", author: "Dostoevskii")
# products << Book.new(name: "War and Peace", price: 25, quantity: 1, genre: "Drama", author: "Tolstoy")
# products << Book.new(name: "Onegin", price: 14, quantity: 3, genre: "Novel", author: "Pushkin")
# products << Film.new(name: "Tenet", price: 15, quantity: 9, year: 2019, director: "Christofer Nolan")
# products << Film.new(name: "Avatar", price: 24, quantity: 15, year: 2010, director: "James Kameron")
# products << Film.new(name: "Transformers", price: 5, quantity: 2, year: 2011, director: "Michale Bay")

# products.each do |product|
#   product.to_s
# end

# ------------------------ 
# film = Film.new(name: "Transformers", price: 5, quantity: 2, year: 2011, director: "Michale Bay")
# film.to_s
# film.year = 2020
# film.director = "Xyi morjovii"
# film.quantity = 6666
# puts film