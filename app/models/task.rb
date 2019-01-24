class Task < ApplicationRecord
  belongs_to :project

  def project_attributes=(project)
    self.project =
    Project.find_or_create_by(title: project.title)
    self.project.update(project)
  end
end
