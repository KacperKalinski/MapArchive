Rails.application.routes.draw do

  match "/private/uploads/document/:id/:basename.:extension", :controller => 'documents', :action => 'download', via: :get
  resources :documents , only: [:index, :new, :create]
  resources :users, only: [:new, :create]#is that needed?
  get 'signup' => 'users#new' #can be done like that?
  get 'signin' => 'sessions#new' #can be done like that?
  post 'signin' => 'sessions#create' #can be done like that?
  delete 'signout' => 'sessions#destroy' #can be done like that?
  root 'welcome#index'

end
