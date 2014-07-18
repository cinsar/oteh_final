class CreateIntegrantes < ActiveRecord::Migration
  def change
    create_table :integrantes do |t|
      t.references :persona, index: true
      t.references :grupo, index: true
      t.boolean :admon
      t.string :status

      t.timestamps
    end
  end
end
