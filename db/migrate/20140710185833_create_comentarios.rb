class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.references :integrante, index: true
      t.references :articulo, index: true
      t.text :comentario

      t.timestamps
    end
  end
end
