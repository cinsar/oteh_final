class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.references :direccion, index: true
      t.string :tel
      t.string :email
      t.string :pag_web
      t.string :contactable_type
      t.string :contactable_id

      t.timestamps
    end
  end
end
