Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tournaments do
    resources :groups do
      resources :players
      resources :matches
    end
  end
  resources :player_infos do
  end

  post 'import-data', to: 'tournaments#import_data'
end