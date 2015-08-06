require 'rails_helper'

RSpec.describe ApiProductsController, type: :controller do

  describe 'search api' do
    it 'returns a list of query results in json' do
      product_list = JSON.parse(RestClient.get "http://localhost:3000/api/products?search=red")
      expect(product_list.first['abc_id']).to eq(100296)
    end
  end

  describe 'update api' do

    let(:product) { Product.create(name: "first wine") }

    it 'updates a single product based on id' do
      product_id = product.id
      update_product = JSON.parse(RestClient.get "http://localhost:3000/api/products/update?product_id=#{product_id}&name=test")
      expect(update_product['name']).to eq("test")
    end
  end

end
