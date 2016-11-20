Rails.application.routes.draw do
  get 'admin', controller: :admin, action: :index

  get 'admin/view/:id', controller: :admin, action: :view

  get 'admin/delete/:id', controller: :admin, action: :delete

  get 'admin/update/:id', controller: :admin, action: :update

  post 'admin/save/:id', controller: :admin, action: :save

  post 'admin/new', controller: :admin, action: :add

  get 'admin/new', controller: :admin, action: :new

  get 'bars', to: 'bar#index'

  post 'bars/review/:id', controller: :bar, action: :updateRating

  post 'bars/:id', controller: :bar, action: :updateCount

end
