class Persona < ActiveRecord::Base
	has_one :contacto, as: :contactable

	validates :nombre, presence: true, length: { minimum: 3 }
	validates :apellido_pat, presence: true, length: { minimum: 3 }


	# Persona.save
	# Persona.create
	# Persona.update

	#p = Persona.new(nombre: "Ana", apellido_pat: "Ramirez")
	#p.valid? #=> true

	accepts_nested_attributes_for :contacto
end
