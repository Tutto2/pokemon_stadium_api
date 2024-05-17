# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Team < ApplicationRecord
  has_many :pokemons
  has_many :pokemon_templates, through: :pokemons

  scope :search_by, ->(term) { where('teams.name ILIKE ?', "%#{term}%") }

  scope :search_pokemon_by, ->(terms) do
    terms.each_pair.inject(all) do |query, (term, value)|
      if term == 'gender' || term == 'nature'
        query.where(pokemons: { term => value })
      elsif term == 'types' || term == 'type'
        query.where("pokemon_templates.types @> ARRAY[?]::varchar[]", [*value].map(&:capitalize)) 
      elsif term == 'moves' || term == 'move'
        query.where("pokemons.moves @> ARRAY[?]::varchar[]", [*value].map(&:capitalize))
      else
        query.where("pokemons.#{term} ILIKE ?", "%#{value}%")
      end
    end
  end
end