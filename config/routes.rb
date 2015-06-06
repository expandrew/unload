Rails.application.routes.draw do
  resources :folders
  resources :upload_urls
  resources :upload_receipts
end
