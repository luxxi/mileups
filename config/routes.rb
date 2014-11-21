Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users,
             :path => '',
             :path_names => {:sign_in => 'login', :sign_up => 'sign_up', :sign_out => 'logout'},
             :controllers => {:registrations => 'registrations'},
             :skip => :registrations
  devise_scope :user do
    post 'users/', :to => 'registrations#create', :as => :user_registration
    get '/', :to => 'pages#home', :as => :new_user_registration
    get 'users/edit', :to => 'devise/registrations#edit', :as => :edit_user_registration
    put 'users/', :to => 'registrations#update'
    delete 'users/', :to => 'registrations#destroy'
  end

  get 'dashboard' => 'trips#dashboard'
  resources :trips do
    post :upload_photos
  end

end
