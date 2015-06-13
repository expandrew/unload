Rails.application.routes.draw do
  root to: 'dashboard#index'
  get 'settings', to: 'settings#index'
  resources :folders do
    resources :upload_urls
    resources :upload_receipts
  end
end
