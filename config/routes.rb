Rails.application.routes.draw do
  comfy_route :cms_admin, :path => '/cms_admin'



  mount Upmin::Engine => '/admin'
  root to: 'comfy/cms/content#show'
  devise_for :users
  resources :users

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => false
end
