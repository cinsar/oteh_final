class User < ActiveRecord::Base

  belongs_to :authenticable, polymorphic: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
end
