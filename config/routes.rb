Rails.application.routes.draw do
  root 'playlists#index'
  devise_for :users
end
