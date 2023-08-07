class Music < Product
  attr_accessor :singer, :genre, :year

  # reads product data from a file and passes it to the constructor
  # with the required keys
  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }

    #also "self.new" or "Music.new", the same thing
    new(
      name: lines[0],
      singer: lines[1],
      genre: lines[2],
      year: lines[3],
      price: lines[4].to_i,
      quantity: lines[5].to_i
    )
  end

  def initialize(params)
    super
    @year = params[:year]
    @genre = params[:genre]
    @singer = params[:singer]
  end

  def to_s
    "Album #{singer} - \"#{@name}\", #{@genre}, #{year}, #{@price} $ (available: #{@quantity})"
  end

  def update
    super
    @genre = params[:genre] if params[:genre]
    @singer = params[:singer] if params[:singer] 
  end
end