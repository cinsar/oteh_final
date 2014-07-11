class Contacto < ActiveRecord::Base
  belongs_to :direccion
  belongs_to :contactable, polymorphic: true
  has_many :representantes

  validates :tel, presence: true#, length: { minimum: 10 }
  validates :email, presence: true#, length: { minimum: 15 }
  
  accepts_nested_attributes_for :direccion
end
