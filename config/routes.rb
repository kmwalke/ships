Rails.application.routes.draw do
  resources :ships do
    resources :components
  end

  resources :components
end
