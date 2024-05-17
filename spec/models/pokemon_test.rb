# == Schema Information
#
# Table name: pokemons
#
#  id                  :bigint           not null, primary key
#  evs                 :integer          default([]), is an Array
#  gender              :string
#  ivs                 :integer          default([]), is an Array
#  moves               :string           default([]), is an Array
#  nature              :string
#  nickname            :string
#  weight              :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  pokemon_template_id :bigint           not null
#  team_id             :bigint           not null
#
# Indexes
#
#  index_pokemons_on_pokemon_template_id  (pokemon_template_id)
#  index_pokemons_on_team_id              (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (pokemon_template_id => pokemon_templates.id)
#  fk_rails_...  (team_id => teams.id)
#
require "test_helper"

class PokemonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
