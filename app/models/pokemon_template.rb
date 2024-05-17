# == Schema Information
#
# Table name: pokemon_templates
#
#  id         :bigint           not null, primary key
#  atk        :integer
#  def        :integer
#  hp         :integer
#  name       :string
#  sp_atk     :integer
#  sp_def     :integer
#  spd        :integer
#  types      :string           default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PokemonTemplate < ApplicationRecord
  has_many :pokemon_template_moves
  has_many :moves, through: :pokemon_template_moves
  has_many :pokemons

  validates :name, uniqueness: true
end
