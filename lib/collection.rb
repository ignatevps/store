class ProductCollection
  # Creating a constant with all products
  PRODUCT_TYPES = {
    film: {dir: 'films', class: Film},
    book: {dir: 'books', class: Book},
    music: {dir: 'music', class: Music}
  }

  def initialize(products = [])
    @products = products
  end

  # films — from dir_path + '/films';
  # music - from dir_path + '/music';
  # books — from dir_path + '/books'.
  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each do |type, hash|

      product_dir = hash[:dir]

      product_class = hash[:class]

      Dir[dir_path + '/' + product_dir + '/*.md'].each do |path|
        products << product_class.from_file(path)
      end
    end

    new(products)
  end

  def to_a
    @products
  end

  # collection.sort!(by: :price, order: :asc)
  def sort!(params)
    case params[:by]
    when :name
      @products.sort_by! { |product| product.to_s }
    when :price
      @products.sort_by! { |product| product.price }
    when :quantity
      @products.sort_by! { |product| product.quantity }
    end

    # ascending sorting
    @products.reverse! if params[:order] == :asc
    
    self
  end
end
