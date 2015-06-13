Rails.application.routes.draw do
  resources :folders do
    resources :upload_urls
    resources :upload_receipts
  end
end
