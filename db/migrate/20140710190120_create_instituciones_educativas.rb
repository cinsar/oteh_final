class CreateInstitucionesEducativas < ActiveRecord::Migration
  def change
    create_table :instituciones_educativas do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
