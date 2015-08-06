product_list = {}
product_list['Products'] = {}
product_list['Products']['List'] = Array.new(100)
offset = 0
while product_list['Products']['List'].length == 100
  product_list = JSON.parse(RestClient.get "http://services.wine.com/api/beta2/service.svc/JSON/catalog?offset=#{offset}&size=100&apikey=#{ENV['API_KEY']}")
  list = product_list['Products']['List']
  list.each do |product|
    current_product = Product.new
    current_product.abc_id = product['Id']
    current_product.name = product['Name']
    current_product.url = product['Url']
    current_product.appellation = product['Appellation']['Name'] if product['Appellation']
    current_product.label = product['Labels']
    current_product.product_type = product['Type']
    current_product.varietal = product['Varietal']['Name'] if product['Varietal']
    current_product.vineyard = product['Vineyard']['Name'] if product['Vineyard']
    current_product.review_url = product['Community']['Reviews']['Url'] if product['Community'] && product['Community']['Reviews']
    current_product.description = product['Description']
    current_product.latitude = product['GeoLocation']['Latitude'] if product['GeoLocation']
    current_product.longitude = product['GeoLocation']['Longitude'] if product['GeoLocation']
    current_product.price_max = product['PriceMax']
    current_product.price_min = product['PriceMin']
    current_product.price_retail = product['PriceRetail']
    current_product.product_attributes = product['ProductAttributes'][0]['Name'] if product['ProductAttributes'] && product['ProductAttributes'][0]
    current_product.highest_rating = product['Ratings']['HighestScore'] if product['Ratings']
    current_product.save
  end
  offset += 100
end
