Rails.application.routes.draw do

  get 'custom_search/find_user_with_profile_title'
  get 'search' => 'custom_search#find_user_with_profile_title'

  devise_for :users
  root 'home#index'
  
  get 'member/:id', to: 'members#show', as: 'member'

  get 'edit_description/:id', to: 'members#edit_description', as: 'edit_member_description'
  patch 'update_description/:id', to: 'members#update_description', as: 'update_member_description'

  get 'edit_user_details/:id', to: 'members#edit_user_details', as: 'edit_user_details'
  patch 'update_user_details/:id', to: 'members#update_user_details', as: 'update_user_details'

  get 'member_connections/:id', to: 'members#connections', as: 'members_connections'

  resources :work_experiences
  resources :connections

end
