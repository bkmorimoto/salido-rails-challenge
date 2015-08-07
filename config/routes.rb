Rails.application.routes.draw do

  root 'products#index'

  resources :products
  get '/search' => 'products#search'

  scope '/api' do
    scope '/v1' do
      scope '/products' do
        get '/' => 'api_products#search'
        scope '/:id' do
          put '/' => 'api_products#update'
        end
      end
    end
  end

end
