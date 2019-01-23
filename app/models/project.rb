class Project < ApplicationRecord
  has_many :tasks
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :comments
  has_many :users, through: :comments
end