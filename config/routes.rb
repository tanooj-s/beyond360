Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/reviews', to: 'static_pages#reviews'
  get '/tours', to: 'static_pages#tours'
  get '/blog', to: 'static_pages#blog'
  get '/contact', to: 'messages#new', as: 'new_message'
  post '/contact', to: 'messages#create'
  resources :messages
end
