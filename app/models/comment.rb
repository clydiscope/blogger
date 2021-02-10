class Comment < ApplicationRecord
  
  belongs_to :commentable, polymorphic: true
  
  belongs_to :user
  
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
