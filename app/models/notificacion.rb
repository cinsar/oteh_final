class Notificacion < ActiveRecord::Base
  belongs_to :integrante
  belongs_to :notificable, polymorphic: true
end
