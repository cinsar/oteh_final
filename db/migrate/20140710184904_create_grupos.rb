class CreateGrupos < ActiveRecord::Migration
  def change
    create_table :grupos do |t|
      t.string :tipo
      t.string :nombre
      t.text :objetivo
      t.boolean :privado

      t.timestamps
    end
  end
end
