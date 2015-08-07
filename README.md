## Setting Up the Application
1. This application uses postgres for the database, so be sure you have postgres running ([Download Page for Postgres](http://www.postgresql.org/download/))
2. Make sure you are in the root directory of the application, in your terminal:
```
bundle install
```
3. Then setup your database:
```
rake db:setup
```
Note that the seeding of the database is rather intense (pulling all catalogs using the API from https://api.wine.com).
I ended up force stopping the seeding process after creating ~5000 records: hit Ctrl+C in your terminal to halt the process.
This was mainly so that I could continue with building the app and not having to wait to seed the entire database.
4. Start a rails server in your terminal
```
rails s
```
5. Navigate to http://localhost:3000/ (this is the default port in which the rails server is launched)

## Using the application
The home page is just a list of all the products that have been seeded into the database. Each is a hyperlink to a page that will display all relevant data for that particular product.

You can add a new product with the 'New Product' link at the top of the page.
You can also edit any existing product by hitting the 'Edit' link next to each listing on the home page.

You can also perform a search, which actually returns JSON. The same JSON if you were to use the search API.

## API Documentation
The API implementation was fairly limited and straight forward. You can perform a search which simply does a string contain check against 3 different attributes of the product: Name, Vineyard, and Varietal.
I chose these three since they seemed the most relevant when someone would want to look a product up.

The relevant URL for the API call with a GET request:
http://localhost:3000/api/v1/products?search=<KEYWORD>

Where <KEYWORD> is the string you want to check for in the three attributes. This query returns JSON of each qualifying product.

Example:
http://localhost:3000/api/v1/products?search=red

Any wine with 'red' in the Name, Vineyard, or Varietal will be returned in the JSON.

You can also update a record in the database with the following API call with a PUT request:
http://localhost:3000/api/v1/products/<PRODUCT_ID>?<COLUMN_NAME>=<COLUMN_VALUE>

In this case, you need to know the product ID in your local database to actually update it. This goes into the <PRODUCT_ID> section.
<COLUMN_NAME> is the name of the column or attribute you want to update
<COLUMN_VALUE> is the value that you want to update the column with

Example:
http://localhost:3000/api/v1/products/5?name=best+red+wine+ever&description=this+is+the+best+red+wine+ever

This will update product with ID 5 in the database with the name: 'best red wine ever' and the description: 'this is the best red wine ever'. It will return JSON of that single record that was updated.

Note there is no validation with the column names, so correct spelling is crucial.
Here are a list of columns that can be updated via the API

- name
- url
- appellation
- product_type
- varietal
- vineyard
- review_url
- description
- latitude
- longitude
- price_max
- price_min
- price_retail
- highest_rating

Again, there is almost no validation of what can be populated in each of these columns, so be sure to only populate relevant data when using the update API

