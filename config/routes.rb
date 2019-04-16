Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blog_posts
  root "blog_posts#index"
  
  resources :users do
    resources :blog_posts
  end
end
