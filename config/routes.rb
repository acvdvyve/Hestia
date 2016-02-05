Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  comfy_route :cms_admin, :path => '/cms_admin'

  root to: 'comfy/cms/content#show'
  devise_for :users
  resources :users
  resources :albums do
    resources :photos
  end

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => true
end
