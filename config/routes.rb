Rails.application.routes.draw do

  get 'pokemon' => 'pokemon#index'
  get 'pokemon/:id' => 'pokemon#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
