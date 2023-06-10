Rails.application.routes.draw do
  root "home#index"

  get "hello", to: "hello#index"

  devise_for :users

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
