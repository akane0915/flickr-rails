class Image < ApplicationRecord
  belongs_to :user

  has_attached_file :picture, styles: {large: "500x500#", medium: "300x300#" }

  validates :title, presence: true
  validates :picture, presence: true

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  # validates_attachment_presence :picture
end
