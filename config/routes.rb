Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  root 'welcome#index'
end
