PeaceCorpsJobBrowser::Application.routes.draw do
  root 'jobs#index'
  get '/list', to: 'jobs#list'
  get '/show/:id', to: 'jobs#show'
end
