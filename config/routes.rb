PeaceCorpsJobBrowser::Application.routes.draw do
  root 'jobs#index'
  get '/list', to: 'jobs#list'
end
