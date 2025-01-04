Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :users
      resources :books do
        member do
          post :check_out
          post :check_in
        end
      end
      resources :shelves
      resources :checkouts
    end
  end

  root "api/v1/books#index"
end
