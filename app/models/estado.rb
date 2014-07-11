class Estado < ActiveRecord::Base
  belongs_to :pais
  has_many :municipios
	validates :nombre, presence: true, length: { minimum: 3 }, uniqueness: true
end
