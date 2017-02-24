Rails.application.routes.draw do

  get 'users/show'
  get 'ideas/index'

  get 'ideas/show'

  get 'ideas/new'

  get '/main'=>'users#index'



  get 'users/new'
  post 'register'=>'users#register'
  get '/bright_ideas'=>'ideas#index'
  post '/login'=>'users#login'
  post '/ideas'=>'ideas#create'
  get 'user/:id'=>'users#show'
  delete '/idea/:id/delete'=>'ideas#destroy'

  get  '/logout' => 'users#logout'
  get '/like/:id'=>'ideas#like'
  get '/bright_ideas/:id' =>'ideas#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
