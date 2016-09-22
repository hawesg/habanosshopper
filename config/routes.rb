Rails.application.routes.draw do
  get 'home/index'

  get 'boxcodes/coh'

  get 'boxcodes/stagnetto'

  get 'vendors/coh'

  get 'vendors/ihavana'

  get 'vendors/stagnetto'

  get 'vendors/compare'

  get 'vendors/' => 'vendors#index'

  get 'prices/cigarsofhabanos' => 'prices#coh'

  get 'prices/ihavanas' => 'prices#ihavana'

  get 'prices/lewisstagnetto' => 'prices#stagnetto'

  get 'prices/' => 'prices#index'

  root 'home#index'

  resources :coh_bcodes
  resources :stag_bcodes
  resources :stag_prices
  resources :ih_prices
  resources :coh_prices
  resources :packages
  resources :vitolas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
