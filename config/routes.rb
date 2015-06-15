Rails.application.routes.draw do
  root to: 'uploader#index'
  get 'upload/:code', to: 'uploader#upload'

  scope '/dashboard' do
    get '', to: redirect('/dashboard/overview')
    get 'overview', to: 'dashboard#index'
    resources :folders do
      resources :upload_receipts, only: [:destroy]
    end
    get 'settings', to: 'settings#index'
  end

end
