class CreateCentrosInvestigaciones < ActiveRecord::Migration
  def change
    create_table :centros_investigaciones do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
