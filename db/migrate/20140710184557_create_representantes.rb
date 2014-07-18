class CreateRepresentantes < ActiveRecord::Migration
  def change
    create_table :representantes do |t|
      t.references :contacto, index: true
      t.string :representable_type
      t.string :representable_id
      t.string :puesto

      t.timestamps
    end
  end
end
