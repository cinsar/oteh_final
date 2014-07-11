class Externo < ActiveRecord::Base
  belongs_to :persona
  
  accepts_nested_attributes_for :persona
end
