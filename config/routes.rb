Rails.application.routes.draw do
  get '/movies', to: 'movies#index'
  get '/admin/movies', to: 'admin/movies#index'
  get '/admin/movies/new', to: 'admin/movies#new'
  get '/admin/movies/:id/edit', to: 'admin/movies#edit'
  post '/admin/movies', to: 'admin/movies#create'
  put '/admin/moves/:id', to: 'admin/movies#update'
  delete '/admin/movies/:id', to: 'admin/movies#destroy'
end
