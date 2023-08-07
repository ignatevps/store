class Product
  attr_accessor :name, :price, :quantity

  def initialize(params)
    @name = params[:name]
    @price = params[:price]
    @quantity = params[:quantity]
  end

  def update(params)
    @name = params[:name] if params[:name]
    @price = params[:price] if params[:price]
    @quantity = params[:quantity] if params[:quantity]
  end
  
  def self.from_file(file_path)
    raise NotImplementedError
  end
end