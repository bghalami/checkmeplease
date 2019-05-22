Rails.application.routes.draw do
  root 'root#index'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index,:create,:show,:update,:destroy] do
        get '/medical_recommendation', to: 'medical_recommendations#show'
        post '/medical_recommendation', to: 'medical_recommendations#create'
        put '/medical_recommendation', to: 'medical_recommendations#update'
        delete '/medical_recommendation', to: 'medical_recommendations#destroy'

        get '/state_id', to: 'state_ids#show'
        post '/state_id', to: 'state_ids#create'
        put '/state_id', to: 'state_ids#update'
        delete '/state_id', to: 'state_ids#destroy'
      end
    end
  end
end
