# == Schema Information
#
# Table name: moves
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Move < ApplicationRecord
  has_many :pokemon_template_moves
  has_many :pokemon_templates, through: :pokemon_template_moves
end
