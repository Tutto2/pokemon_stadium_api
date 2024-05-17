class PokemonTemplateBlueprint < Blueprinter::Base
  identifier :id
  
  view :simple do
    fields :name, :types
  end
  
  view :complete do
    include_view :simple
    fields :hp, :atk, :def, :sp_atk, :sp_def, :spd
  end
end