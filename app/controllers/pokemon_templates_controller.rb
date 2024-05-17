class PokemonTemplatesController < ApplicationController
  def index
    render json: PokemonTemplateBlueprint.render(PokemonTemplate.all, view: :simple)
  end

  def show
    render json: PokemonTemplateBlueprint.render(pokemon_template, view: :complete)
  end

  def create
    pokemon_template = PokemonTemplate.create(pokemon_template_params)

    render json: PokemonTemplateBlueprint.render(pokemon_template, view: :complete), status: :created
  end
  
  def update
    pokemon_template.update(pokemon_template_params)

    render json: PokemonTemplateBlueprint.render(pokemon_template, view: :complete)
  end
  
  def destroy
    pokemon_template.destroy
    
    render json: PokemonTemplateBlueprint.render(PokemonTemplate.all, view: :simple)
  end

  private
  def pokemon_template_params
    params.require(:pokemon_template).permit(:name, :hp, :atk, :def, :sp_atk, :sp_def, :spd, types: [])
  end

  def pokemon_template
    @pokemon_template ||= PokemonTemplate.find_by(name: params[:id].capitalize) || PokemonTemplate.find(params[:id])
  end
end