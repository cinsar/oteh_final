class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :nombre
      t.references :pais, index: true

      t.timestamps
    end
  end
end
