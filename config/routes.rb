Rails.application.routes.draw do

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

  resources :inputs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
