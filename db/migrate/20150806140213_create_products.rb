class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :abc_id
      t.string :name
      t.string :url
      t.string :appellation
      t.string :product_type
      t.string :varietal
      t.string :vineyard
      t.string :review_url
      t.text :description
      t.integer :latitude
      t.integer :longitude
      t.decimal :price_max, precision: 8, scale: 2
      t.decimal :price_min, precision: 8, scale: 2
      t.decimal :price_retail, precision: 8, scale: 2
      t.string :product_attributes
      t.string :highest_rating

      t.timestamps
    end
  end
end
