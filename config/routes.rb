Rails.application.routes.draw do
  resources :users
  resources :favorites
  resources :sessions
  
  root to: "pictures#new"
  resources :pictures do
      collection do
        post :confirm
      end
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine,at: "/letter_opener"
  end
end
