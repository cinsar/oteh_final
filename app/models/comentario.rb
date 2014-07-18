class Comentario < ActiveRecord::Base
  belongs_to :integrante
  belongs_to :articulo
end
