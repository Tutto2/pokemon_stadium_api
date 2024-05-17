class PokemonBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :nickname, :types, :gender, :nature, :moves

  view :simple do
    excludes :gender, :nature, :moves
  end

  view :detailed do
    fields :ivs, :evs

    field :stats do |pokemon|
      {
        hp: pokemon.hp,
        atk: pokemon.atk,
        def: pokemon.def,
        sp_atk: pokemon.sp_atk,
        sp_def: pokemon.sp_def,
        spd: pokemon.spd
      }
    end
  end
end