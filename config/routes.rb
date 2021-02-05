Rails.application.routes.draw do
  # config/routes.rb
  root to: 'pages#home'
  # get "/:locale", to: 'pages#home'
  get "(:locale)", locale: /en|it|de/, to: 'pages#home'
  # scope "/:locale" do
  scope "(:locale)", locale: /en|it|de/ do
    resources :events, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
