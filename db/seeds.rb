require 'csv'

# moves = [
#   {name: 'Tackle'},
#   {name: 'Flail'},
#   {name: 'Splash'}
# ]

# moves.map! do |move|
#   Move.create(move)
# end

# pokemon_template = PokemonTemplate.create(
#   name: "Magikarp",
#   types: ['WATER'],
#   hp: 20,
#   atk: 10,
#   def: 55, 
#   sp_atk: 15,
#   sp_def: 20,
#   spd: 80
# )

# moves.each do |move|
#   PokemonTemplateMove.create(
#     move: move,
#     pokemon_template_id: pokemon_template.id
#   )
# end

# team = Team.create(name: 'Los Troncos')

# Pokemon.create(
#   pokemon_template: pokemon_template,
#   team_id: team.id,
#   gender: 'male',
#   nickname: 'Magicapo',
#   nature: 'timid',
#   weight: 20.2,
#   evs: [4, 0, 252, 0, 0, 252],
#   ivs: [31, 31, 31, 31, 31, 31],
#   moves: moves.map(&:name)
# )