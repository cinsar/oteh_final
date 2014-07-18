class CreateEstudiantes < ActiveRecord::Migration
  def change
    create_table :estudiantes do |t|
      t.references :persona, index: true
      t.references :institucion_educativa, index: true

      t.timestamps
    end
  end
end
