class Film < Product
  attr_accessor :director, :year

  # reads product data from a file and passes it to the constructor
  # with the required keys
  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map(&:chomp)

    # also "self.new" or "Film.new", the same thing
    new(
      name: lines[0],
      director: lines[1],
      year: lines[2],
      price: lines[3].to_i,
      quantity: lines[4].to_i
    )
  end

  def initialize(params)
    super
    @year = params[:year]
    @director = params[:director]
  end

  def to_s
    "Film #{@name}, #{@year}, director - #{@director}, #{@price} $ (available: #{@quantity})"
  end

  def update(params)
    super
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end
end
