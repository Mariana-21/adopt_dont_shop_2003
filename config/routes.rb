Rails.application.routes.draw do

  get '/shelters', to: "shelters#index"
  get '/shelters/new', to: "shelters#new"
  get '/shelters/:shelter_id', to: "shelters#show"
  post '/shelters', to: "shelters#create"
  get '/shelters/:shelter_id/edit', to: "shelters#edit"
  patch '/shelters/:shelter_id', to: "shelters#update"
  delete '/shelters/:shelter_id', to: "shelters#destroy"
end
