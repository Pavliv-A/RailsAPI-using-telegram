Rails.application.routes.draw do
  root 'notifications#index'
  get 'notifications/index', to: 'notifications#index', as: 'notifications'
  resources :games
  resources :levels
  resources :notifications
  post 'games/all_games', to: 'game_levels#all_games'
  get 'best_result', to: 'notifications#best_result'
  get 'games/all_games', to: 'game_levels#all_games'
end
