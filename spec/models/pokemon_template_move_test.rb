# == Schema Information
#
# Table name: pokemon_template_moves
#
#  id                  :bigint           not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  move_id             :bigint           not null
#  pokemon_template_id :bigint           not null
#
# Indexes
#
#  index_pokemon_template_moves_on_move_id              (move_id)
#  index_pokemon_template_moves_on_pokemon_template_id  (pokemon_template_id)
#
# Foreign Keys
#
#  fk_rails_...  (move_id => moves.id)
#  fk_rails_...  (pokemon_template_id => pokemon_templates.id)
#
require "test_helper"

class PokemonTemplateMoveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
