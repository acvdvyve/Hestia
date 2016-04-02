Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  comfy_route :cms_admin, :path => '/cms_admin'

  root to: 'comfy/cms/content#show'
  
  if Rails.env.development?
  devise_for :user, :skip => :sessions
  else devise_for :user
  end
  
  resources :users
  resources :albums do
    get 'process_photos', :action => 'process_photos'
    resources :photos
  end

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => true
end
