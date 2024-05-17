Rails.application.routes.draw do
  resources :teams do
    resources :pokemons, module: 'teams'
  end

  resources :pokemon_templates do
    resources :moves, only: %i[index show], module: 'pokemon_templates' do
      post :associate, on: :collection
    end
  end

  resources :moves do
    resources :pokemon_templates, only: %i[index show], module: 'moves' do
       post :associate, on: :collection
    end
  end
end
