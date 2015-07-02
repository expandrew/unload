Rails.application.routes.draw do
  # root route is set with config/initializers/high_voltage.rb

  # or like below without initializer:
  # root to: 'high_voltage/pages#show', id: 'landing'

  get 'upload/', to: redirect(''), as: 'no_code'
  get 'upload/:code', to: 'uploads#new', as: 'upload'
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
