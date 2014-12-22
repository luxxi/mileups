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
    get ':id/edit', :to => 'registrations#edit', :as => :edit_user_registration
    put 'users/', :to => 'registrations#update'
    delete 'users', :to => 'registrations#destroy'
  end

  get 'dashboard' => 'trips#dashboard'
  post ':user_id/trip', to: 'trips#upload_photos', as: :trip_upload_photos
  post ':user_id/photo', to: 'trips#photo_location', as: :photo_location
  get ':user_id/new_trip', to: 'trips#new', as: :trip_new
  post ':user_id/new_trip', to: 'trips#create', as: :trip_create
  get ':user_id/:id', to: 'trips#show', as: :trip
  get ':user_id/:id/edit', to: 'trips#edit', as: :trip_edit
  put ':user_id/:id', to: 'trips#update'
  patch ':user_id/:id', to: 'trips#update'
  delete ':user_id/:id', to: 'trips#destroy'

end
