class User < ApplicationRecord
  has_many :borads, dependent: :destroy
  has_many :comments, dependent: :destroy
  after_create :assign_default_role
  rolify
  def assign_default_role
    add_role(:student)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
