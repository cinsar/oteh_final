class CreateInvestigadores < ActiveRecord::Migration
  def change
    create_table :investigadores do |t|
      t.references :persona, index: true
      t.references :centro_investigacion, index: true
      t.boolean :promep
      t.boolean :sni
      t.boolean :tc

      t.timestamps
    end
  end
end
