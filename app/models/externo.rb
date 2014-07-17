class Externo < ActiveRecord::Base
  belongs_to :persona, autosave: true
  has_one :contacto, as: :contactable, autosave: true
  
  accepts_nested_attributes_for :persona
end
