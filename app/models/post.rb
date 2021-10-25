class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { minimum: 10 }
end
