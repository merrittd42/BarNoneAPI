Rails.application.routes.draw do
<<<<<<< HEAD
=======
  get 'bars', to: 'bar#index'

>>>>>>> 3d0e9909572196c4a9267c0c96794efcfc2226ea
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/bars/', to: 'bar#index'
end
