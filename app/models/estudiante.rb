class Estudiante < ActiveRecord::Base
  belongs_to :persona
  belongs_to :institucion_educativa
  has_one :contacto, as: :contactable
end
