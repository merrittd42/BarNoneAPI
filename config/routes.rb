Rails.application.routes.draw do
<<<<<<< HEAD
  get 'admin', controller: :admin, action: :index

  get 'admin/view/:id', controller: :admin, action: :view

  get 'admin/delete/:id', controller: :admin, action: :delete

  get 'admin/update/:id', controller: :admin, action: :update

  post 'admin/save/:id', controller: :admin, action: :save

  post 'admin/new', controller: :admin, action: :add

  get 'admin/new', controller: :admin, action: :new

  get 'bars', to: 'bar#index'

=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
>>>>>>> ac662da78eb1c8077e6f53d780c740eabccec903
end
