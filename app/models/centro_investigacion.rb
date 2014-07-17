class CentroInvestigacion < ActiveRecord::Base
	has_many :investigadores
	has_one :contacto, as: :contactable, autosave: true
	validates :nombre, presence: true, length: { minimum: 3 }
end
