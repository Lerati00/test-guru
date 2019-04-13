class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :image_url, presence: true

  def self.rest_badges(badges)
    Badge.all - badges
  end

end
