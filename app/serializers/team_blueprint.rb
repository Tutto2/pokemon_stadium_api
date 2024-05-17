class TeamBlueprint < Blueprinter::Base
  identifier :id

  fields :name

  view :simple do
    association :pokemons, blueprint: PokemonBlueprint, view: :simple
  end

  view :detailed do
    association :pokemons, blueprint: PokemonBlueprint, view: :detailed
  end
end