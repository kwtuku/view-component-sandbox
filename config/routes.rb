Rails.application.routes.draw do
  root "home#index"

  namespace :primer do
    resources :repositories
  end

  scope :tailwindui do
    Tailwindui::Example.names.each do |name|
      get name, to: "tailwindui##{name}"
    end
  end

  get "hello", to: "hello#index"

  devise_for :users

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
