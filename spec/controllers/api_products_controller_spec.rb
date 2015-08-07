require 'rails_helper'

RSpec.describe ApiProductsController, type: :controller do

  describe 'search api' do
    it 'returns a list of query results in json' do
      product_list = JSON.parse(RestClient.get "http://localhost:3000/api/v1/products?search=red")
      first_product = product_list.first
      last_product = product_list.last
      expect(first_product['name'].downcase.include?("red") || first_product['vineyard'].downcase.include?("red") || first_product['varietal'].downcase.include?("red")).to eq(true)
      expect(last_product['name'].downcase.include?("red") || last_product['vineyard'].downcase.include?("red") || last_product['varietal'].downcase.include?("red")).to eq(true)
    end
  end

  describe 'update api' do

    let(:product) { Product.create(name: "first wine") }

    it 'updates a single product based on id' do
      product_id = product.id
      update_product = JSON.parse(RestClient.get "http://localhost:3000/api/v1/products/update?product_id=#{product_id}&name=test")
      expect(update_product['name']).to eq("test")
    end
  end

end
