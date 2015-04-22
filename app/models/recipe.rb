class Recipe < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50}
  validates :ingredients, presence: true, length: { maximum: 1000}
  validates :directions, presence: true, length: { maximum: 2000}
  
end
