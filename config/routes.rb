Rails.application.routes.draw do
  root to: 'uploader#index'
  get 'upload', to: redirect('/')
  get 'upload/:code', to: 'uploader#upload'

  scope '/dashboard' do
    get '', to: redirect('/dashboard/folders')
    resources :folders do
      post 'code', to: 'folders#generate_code'
      delete 'code', to: 'folders#destroy_code'
      resources :upload_receipts, only: [:destroy]
    end
    get 'settings', to: 'settings#index'
  end

end
