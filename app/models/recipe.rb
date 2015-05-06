class Recipe < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50}
  validates :ingredients, presence: true, length: { maximum: 1000}
  validates :directions, presence: true, length: { maximum: 2000}
  validate :picture_size
  
  private
  
  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
  
end
