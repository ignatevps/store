class Product
  attr_reader :name, :price, :quantity

  def initialize(params)
    @name = params[:name]
    @price = params[:price]
    @quantity = params[:quantity]
  end
end