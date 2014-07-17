class Empresa < ActiveRecord::Base
	has_one :contacto, as: :contactable, autosave: true

	validates :nombre, presence: true, length: { minimum: 3 }
	validates :giro, presence: true, length: { minimum: 3 }
end
