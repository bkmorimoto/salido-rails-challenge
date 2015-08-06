class Product < ActiveRecord::Base

  def self.search(query)
    where("lower(name) like ?", "%#{query.downcase}%") | where("lower(vineyard) like ?", "%#{query.downcase}%") | where("lower(varietal) like ?", "%#{query.downcase}%")
  end

  def self.update(product_id, params)
    product = Product.find(product_id)
    params.each do |column, value|
      product[column] = value if product[column]
    end
    product.save
    product
  end

end
