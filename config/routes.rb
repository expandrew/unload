Rails.application.routes.draw do
  root to: 'uploads#index'

  get 'upload/', to: redirect(''), as: 'no_code'
  get 'upload/:code', to: 'uploads#new', as: 'upload'
  post 'upload/:code', to: 'uploads#create'

  scope '/dashboard' do
    get '', to: redirect('/dashboard/folders'), as: 'dashboard'
    resources :folders do
      post 'code', to: 'folders#generate_code'
      delete 'code', to: 'folders#destroy_code'
      resources :upload_receipts, only: [ :destroy ]
    end
    get 'settings', to: 'settings#index'
  end

end
