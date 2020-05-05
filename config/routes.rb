Rails.application.routes.draw do

  get '/shelters', to: "shelters#index"
  get '/shelters/:shelter_id', to: "shelters#show"
end
