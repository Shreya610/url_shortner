Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   root 'home#index'
   post '/', to: 'home#index'
   get '/stats', to: 'home#stats'
   get '/:slug', to: 'home#redirectToUrl'
  
  # Defines the root path route ("/")
  # root "articles#index"
end
