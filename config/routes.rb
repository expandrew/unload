Rails.application.routes.draw do
  root to: 'dashboard#index'
  get 'settings', to: 'settings#index'
  resources :folders do
    resources :upload_receipts, only: [:destroy]
  end
  get 'upload', to: 'uploader#index'
  get 'upload/:code', to: 'uploader#upload'
end
