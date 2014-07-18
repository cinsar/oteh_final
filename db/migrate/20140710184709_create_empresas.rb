class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nombre
      t.string :giro
      t.string :no_empleados
      t.string :persona_fiscal

      t.timestamps
    end
  end
end
