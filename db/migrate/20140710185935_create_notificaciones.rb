class CreateNotificaciones < ActiveRecord::Migration
  def change
    create_table :notificaciones do |t|
      t.references :integrante, index: true
      t.string :notificable_type
      t.string :notificable_id
      t.date :fecha

      t.timestamps
    end
  end
end
