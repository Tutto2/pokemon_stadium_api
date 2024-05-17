class CreatePokemonTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_templates do |t|
      t.string :name
      t.string :types, array: true, default: []
      t.integer :hp
      t.integer :atk
      t.integer :def
      t.integer :sp_atk
      t.integer :sp_def
      t.integer :spd

      t.timestamps
    end
  end
end
