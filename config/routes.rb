Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  root  'welcome#index'

  resources :articles do
  member do
  get  :summary
 end
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  end




# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
