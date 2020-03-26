class Pic < ApplicationRecord

	has_attached_file :image, :styles => { medium: "300x300>", thumb: "100x100>" }
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy
end
