class StatusChange < ApplicationRecord
  belongs_to :project
  belongs_to :user

  STATUSES = {
    planning: 0,
    in_progress: 1,
    review: 2,
    completed: 3
  }.freeze

  def from_status_humanized
    STATUSES.key(self[:from_status]).to_s.humanize
  end

  def to_status_humanized
    STATUSES.key(self[:to_status]).to_s.humanize
  end
end
