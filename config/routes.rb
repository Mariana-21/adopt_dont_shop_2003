Rails.application.routes.draw do

  get '/shelters', to: "shelters#index"
  get '/shelters/new', to: "shelters#new"
  get '/shelters/:shelter_id', to: "shelters#show"
  post '/shelters', to: "shelters#create"
end
