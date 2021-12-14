Rails.application.routes.draw do
  get '/studios', to: 'studios#index'
  get '/movies/:id', to: 'movies#show'
  post '/movies', to: 'movies#show'
end
