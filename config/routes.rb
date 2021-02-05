Rails.application.routes.draw do
  root to: redirect("/#{I18n.locale}"), as: :redirected_root
  get "/:locale", to: 'pages#home'
  scope "/:locale" do
    resources :events, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
