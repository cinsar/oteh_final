class Grupo < ActiveRecord::Base
  has_many :integrantes

  validates :nombre, presence: true, length: { minimum: 3 }
  validates :tipo,  presence: true, length: { minimum: 3 }

end
