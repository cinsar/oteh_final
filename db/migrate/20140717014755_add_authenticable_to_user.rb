class AddAuthenticableToUser < ActiveRecord::Migration
  def change
    add_reference :users, :authenticable, index: true, polymorphic: true
  end
end
