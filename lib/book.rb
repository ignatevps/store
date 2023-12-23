class Book < Product
  attr_accessor :author, :genre

  # reads product data from a file and passes it to the constructor
  # with the required keys
  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { &:chomp }

    #also "self.new" or "Book.new", the same thing
    new(
      name: lines[0],xs
      genre: lines[1],
      author: lines[2],
      price: lines[3].to_i,
      quantity: lines[4].to_i
    )
  end

  def initialize(params)
    super
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    "Book #{@name}, #{@genre}, author - #{@author}, #{@price} $ (available: #{@quantity})"
  end

  def update
    super
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end
end
