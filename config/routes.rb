Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index,:create,:show,:update,:destroy] do
        get '/medical_recommendation', to: 'medical_recommendation#show'
        post '/medical_recommendation', to: 'medical_recommendation#create'
        put '/medical_recommendation', to: 'medical_recommendation#update'
        delete '/medical_recommendation', to: 'medical_recommendation#destroy'

        get '/state_id', to: 'state_id#show'
        post '/state_id', to: 'state_id#create'
        put '/state_id', to: 'state_id#update'
        delete '/state_id', to: 'state_id#destroy'
      end
    end
  end
end
