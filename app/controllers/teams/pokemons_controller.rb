module Teams
  class PokemonsController < ApplicationController
    def index
      render json: PokemonBlueprint.render(team.pokemons, view: view_param)
    end

    def show
      render json: PokemonBlueprint.render(pokemon, view: :detailed)
    end

    def create
      pokemon = team.pokemons.create(pokemon_params)

      render json: PokemonBlueprint.render(pokemon, view: :detailed), status: :created
    end
    
    def update
      pokemon.update(pokemon_params)

      render json: PokemonBlueprint.render(pokemon, view: :detailed)
    end
    
    def destroy
      pokemon.destroy
    
      pokemons = team.pokemons.all
      render json: PokemonBlueprint.render(pokemons, view: :simple)
    end

    private
    def team
      @team ||= Team.find(params[:team_id])
    end

    def pokemon
      @pokemon ||= team.pokemons.find(params[:id])
    end

    def pokemon_params
      params.require(:pokemon).permit(:pokemon_template_id, :team_id, :nickname, :nature, :gender, :weight, evs: [], ivs: [], moves: [])
    end

    def view_param
      permited = %w[detailed simple]
    
      params[:view].to_sym if permited.include?(params[:view])
    end
  end
end