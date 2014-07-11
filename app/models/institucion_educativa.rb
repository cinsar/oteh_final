class InstitucionEducativa < ActiveRecord::Base
	has_many :estudiantes
	#has_many :areas_academicas
	validates :nombre, presence: true, length: { minimum: 3 }
end
