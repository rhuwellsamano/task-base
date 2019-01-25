class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :comments
  has_many :projects, through: :comments # TAKE THIS OUT LATER

  validates :name, presence: true, length: {maximum: 25}



end
