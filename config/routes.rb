Rails.application.routes.draw do
  get 'admin', controller: :admin, action: :index

  get 'admin/:id', controller: :admin, action: :view

  delete 'admin/:id', controller: :admin, action: :delete

  put 'admin/:id', controller: :admin, action: :update

  post 'admin', controller: :admin, action: :update

  get 'bars', to: 'bar#index'


end
