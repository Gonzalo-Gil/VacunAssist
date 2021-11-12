class User < ApplicationRecord
  after_initialize :set_default_role, :if => :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: [:paciente, :enfermero, :admin]
  
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

  def set_default_role
    self.role ||= :paciente
  end

end

