class Articulo < ActiveRecord::Base
  belongs_to :integrante
  has_many :comentarios
end
