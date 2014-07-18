class Direccion < ActiveRecord::Base
	has_one :contacto 
	belongs_to :municipio
  


  validates :calle, presence: true#, length: { minimum: 3 }
  validates :colonia, presence: true, length: { minimum: 3 }
  #validates :municipio, presence: true, length: { minimum: 3 }
  validates :cp, presence: true, length: { minimum: 3 }
end
