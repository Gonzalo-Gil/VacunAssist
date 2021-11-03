class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :turnos
  has_many :vacunas

  accepts_nested_attributes_for :turnos

  validates :dni, uniqueness: true
end

