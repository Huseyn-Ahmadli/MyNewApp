Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: %i[create destroy show new]
  end
  root 'pages#index'
end
