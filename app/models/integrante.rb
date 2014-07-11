class Integrante < ActiveRecord::Base
  belongs_to :persona
  belongs_to :grupo
end
