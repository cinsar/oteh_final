class CreateExternos < ActiveRecord::Migration
  def change
    create_table :externos do |t|
      t.references :persona, index: true

      t.timestamps
    end
  end
end
