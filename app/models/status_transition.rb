class StatusTransition < ApplicationRecord
  # Associations
  belongs_to :project

  # Validations
  validates :previous_status, :new_status, presence: true, inclusion: { in: Project.statuses.keys }

  def to_s
    "Status changed from #{previous_status.titleize} to #{new_status.titleize}"
  end
end
