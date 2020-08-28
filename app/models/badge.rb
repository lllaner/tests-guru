class Badge < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :badge_users
  has_many :users, through: :badge_users
  belongs_to :badge_rule

end
