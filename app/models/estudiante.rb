class Estudiante < ActiveRecord::Base
  belongs_to :persona, autosave: true
  belongs_to :institucion_educativa
  has_one :contacto, as: :contactable, autosave: true
end
