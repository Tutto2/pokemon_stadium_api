module PokemonTemplates
  class MovesController < ApplicationController
    def index
      render json: MoveBlueprint.render(pokemon_template.moves)
    end

    def show
      render json: MoveBlueprint.render(move)
    end

    def associate
      pokemon_template.move_ids = move_params.fetch(:ids)

      render json: MoveBlueprint.render(pokemon_template.moves)
    end

    private
    def pokemon_template
      @pokemon_template ||= PokemonTemplate.find(params[:pokemon_template_id])
    end

    def move
      @move ||= pokemon_template.moves.find(params[:id])
    end
    
    def move_params
      params.require(:move).permit(ids: [])
    end
  end
end