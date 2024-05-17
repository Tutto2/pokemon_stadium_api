class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.references :pokemon_template, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.string :nickname
      t.string :nature
      t.string :gender
      t.float :weight
      t.integer :evs, array: true, default: []
      t.integer :ivs, array: true, default: []
      t.string :moves, array: true, default: []

      t.timestamps
    end
  end
end
