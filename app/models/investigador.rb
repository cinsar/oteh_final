class Investigador < ActiveRecord::Base
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :persona, autosave: true
  belongs_to :centro_investigacion

  accepts_nested_attributes_for :persona
end
