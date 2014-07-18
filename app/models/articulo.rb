class Articulo < ActiveRecord::Base
  belongs_to :integrante
  has_many :comentarios



  validates :tema, presence: true, length: { minimum: 3 }
  validates :titulo, presence: true, length: { minimum: 3 }
  validates :tipo,  presence: true, length: { minimum: 3 }
end
