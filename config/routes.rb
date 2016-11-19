Rails.application.routes.draw do
  get 'admin', controller: :admin, action: :index

  get 'admin/view/:id', controller: :admin, action: :view

  delete 'admin/delete/:id', controller: :admin, action: :delete

  put 'admin/update/:id', controller: :admin, action: :update

  post 'admin/new', controller: :admin, action: :add

  get 'admin/new', controller: :admin, action: :new

  get 'bars', to: 'bar#index'

end
