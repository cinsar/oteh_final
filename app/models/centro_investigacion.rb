class CentroInvestigacion < ActiveRecord::Base
	has_many :investigadores
	validates :descripcion, presence: true, length: { minimum: 3 }
end
