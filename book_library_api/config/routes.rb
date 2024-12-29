Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books, except: [:new, :edit] do
        collection do
          get :search
        end
      end

      resources :loans, only: [:create] do
        member do
          patch :return_book
        end
      end
    end
  end  
end
