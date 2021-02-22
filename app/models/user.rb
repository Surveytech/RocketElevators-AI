class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role, optional: true
  belongs_to :employee, optional: true
  belongs_to :customer, optional: true
  has_many :quotes, dependent: :destroy
  validates :name, presence: true
  # before_save :assign_role


  def admin?
    role.name == 'Admin'
  end

  def regular?
    role.name == 'Regular'
  end

  def employee?
    role.name == 'Employee'
  end
end
