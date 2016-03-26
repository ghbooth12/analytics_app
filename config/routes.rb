Rails.application.routes.draw do

  resources :users, only: [] do
    get 'registered_applications/add_form' => 'registered_applications#add_form', as: :add_form

    resources :registered_applications do
      collection  do
        post 'create_multiple'
      end
    end
  end

  devise_for :users

  root 'welcome#index'
end
