# app/models/project.rb
class Project < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  enum status: { planning: 0, in_progress: 1, review: 2, completed: 3 }

  def previous_status
    self.status_before_last_save
  end
end
