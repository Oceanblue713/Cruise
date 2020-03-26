class Blog < ApplicationRecord
  belongs_to :user
  mount_uploader :img, ImgUploader

  validates :title, presence: true
  validates :content, presence: true
end
