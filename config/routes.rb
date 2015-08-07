Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
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
