class CreateArticulos < ActiveRecord::Migration
  def change
    create_table :articulos do |t|
      t.string :tema
      t.string :titulo
      t.text :descripcion
      t.string :archivo
      t.references :integrante, index: true
      t.string :url
      t.string :tipo

      t.timestamps
    end
  end
end
