class Project < ApplicationRecord
  # Enums
  enum :status, { pending: 0, started: 1, finished: 2, cancelled: 3 }

  # Associations
  has_many :comments, dependent: :destroy
  has_many :status_transitions, dependent: :destroy

  # Callbacks
  after_initialize :init, if: :new_record?
  after_update :create_status_transition, if: :saved_change_to_status

  # Nested Attributes
  accepts_nested_attributes_for :comments, allow_destroy: true

  # Validations
  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }

  def to_s
    name
  end

  private

  def init
    self.status = self.class.statuses.fetch(:pending)
  end

  def create_status_transition
    StatusTransition.create(
      project: self,
      previous_status: previous_changes['status'].first,
      new_status: status
    )
  end
end
