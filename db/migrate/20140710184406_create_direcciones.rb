class CreateDirecciones < ActiveRecord::Migration
  def change
    create_table :direcciones do |t|
      t.string :calle
      t.string :colonia
      t.references :municipio, index: true
      t.integer :cp

      t.timestamps
    end
  end
end
