class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', inverse_of: :publications, optional: true
  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0}

  scope :complexity, -> (complexity) {
    where(level: choice_complexity(complexity)) if [:easy, :average, :hard].include?(complexity) 
  }
  scope :title_with_category, ->(title) { joins(:category).where(categories: {title: name}) }

  private

  def self.choice_complexity(complexity)
    { easy: 0..1, average: 2..4, hard: 5..Float::INFINITY }[complexity]
  end
end
