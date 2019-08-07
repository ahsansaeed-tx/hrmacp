class User < ApplicationRecord
  has_many :applications, :dependent => :destroy
  has_many :jobs, through: :applications
  has_many :salaries
  has_many :attendances
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :registerable, :confirmable
  enum role: [:user, :admin, :hr, :employee]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end
end
