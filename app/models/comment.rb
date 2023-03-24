class Comment < ApplicationRecord
  # Associations
  belongs_to :project

  # Callbacks
  after_initialize :init, if: :new_record?
  before_update :set_as_edited, if: -> { persisted? && content_changed? }

  # Validations
  validates :content, presence: true
  validates :author, presence: true, length: { maximum: 255 }

  private

  def init
    self.edited = false
  end

  def set_as_edited
    self.edited = true
  end
end
