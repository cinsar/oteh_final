class Integrante < ActiveRecord::Base
  belongs_to :persona
  belongs_to :grupo

  has_many :comentarios
end
