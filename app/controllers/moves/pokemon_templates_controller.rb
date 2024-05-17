
module Moves
  class PokemonTemplatesController < ApplicationController
    def index
      render json: PokemonTemplateBlueprint.render(move.pokemon_templates, view: :simple)
    end

    def show
      render json: PokemonTemplateBlueprint.render(pokemon_template, view: :complete)
    end

    def associate
      move.pokemon_template_ids = pokemon_template_params.fetch(:ids)

      render json: PokemonTemplateBlueprint.render(move.pokemon_templates, view: :simple)
    end

    private
    def move
      @move ||= Move.find(params[:move_id])
    end

    def pokemon_template
      @pokemon_template ||= move.pokemon_templates.find(params[:id])
    end

    def pokemon_template_params
      params.require(:pokemon_template).permit(ids: [])
    end
  end
end