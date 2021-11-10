class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :turnos
  has_many :vacunas

  accepts_nested_attributes_for :turnos

  validates :dni, uniqueness: true
  validates :email, uniqueness: false
  
  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end

