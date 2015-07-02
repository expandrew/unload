Rails.application.routes.draw do
  # root route is set with config/initializers/high_voltage.rb

  # or like below without initializer:
  # root to: 'high_voltage/pages#show', id: 'landing'

  get 'upload/', to: 'uploads#enter_code', as: 'enter_upload_code'
  post 'upload/', to: 'uploads#validate_code'
  get 'upload/:code', to: 'uploads#new', as: 'upload_code'
  post 'upload/:code', to: 'uploads#create'

  scope '/dashboard' do
    get '', to: redirect('/dashboard/folders'), as: 'dashboard'
    resources :folders do
      post 'code', to: 'folders#generate_code'
      delete 'code', to: 'folders#destroy_code'
    end
    get 'settings', to: 'settings#index'
  end

end
