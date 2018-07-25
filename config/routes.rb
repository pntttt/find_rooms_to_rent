Rails.application.routes.draw do
  root "pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :rooms, except: [:edit] do
    member do
      get "listing", to: "listings#edit"
      get "pricing", to: "pricings#edit"
      get "description", to: "descriptions#edit"
      get "amenities", to: "amenities#edit"
      get "location", to: "locations#edit"
      get "photo_upload"
    end
    resources :photos, only: [:create, :destroy]
  end
  resources :reservations, only: [:index]
  resources :trips, only: [:index]
end
