class MoveBlueprint < Blueprinter::Base
  identifier :id

  fields :name

  # view :pokemon_template_moves do
  #   association :pokemon_templates, blueprint: PokemonTemplateBlueprint, view: :simple, name: :pokemons
  # end

  # view :pokemon_template_move do
  #   association :pokemon_templates, blueprint: PokemonTemplateBlueprint, view: :complete, name: :pokemons
  # end
end