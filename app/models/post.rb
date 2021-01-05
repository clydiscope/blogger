class Post < ApplicationRecord
	belongs_to :topic
	belongs_to :user
	
	has_many :comments, dependent: :destroy
	
	default_scope { order('created_at DESC') }
	
	scope :ordered_by_title, -> { reorder(title: :asc) }
	
	scope :ordered_by_reverse_created_at, -> { reorder(created_at: :desc) }	 
	
	
	validates :title, length: { minimum: 5 }, presence: true
	validates :body, length: { minimum: 20 }, presence: true
	validates :topic, presence: true
	validates :user, presence: true
	
end
