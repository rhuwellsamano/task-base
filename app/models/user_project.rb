class UserProject < ApplicationRecord
  belongs_to :user, :project
end
