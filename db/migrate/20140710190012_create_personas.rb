class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :nombre
      t.string :apellido_pat
      t.string :apellido_mat

      t.timestamps
    end
  end
end
