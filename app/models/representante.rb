class Representante < ActiveRecord::Base
  	belongs_to :contacto, autosave: true
  	belongs_to :representable, polymorphic: true

	#has_one :contacto, as: :contactable

	#validates :nombre, presence: true, length: { minimum: 3 }
	#validates :apellido_pat, presence: true, length: { minimum: 3 }

	accepts_nested_attributes_for :contacto
end
