# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates_presence_of :content
end
