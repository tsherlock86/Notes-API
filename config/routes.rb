Rails.application.routes.draw do

  scope '/api' do
    resources :users, except: [:new, :edit] do
      resources :notes, except: [:new, :edit]
    end
    resources :notes, except: [:new, :edit]
    resources :tags, only: [:show]
  end

  root 'notes#index'

end
