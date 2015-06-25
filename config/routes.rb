Rails.application.routes.draw do
  comfy_route :cms_admin, :path => '/cms_admin'

  

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :users

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => false
end
