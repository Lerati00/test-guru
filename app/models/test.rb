class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', inverse_of: :publications, optional: true
  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0}

  scope :complexity, -> (complexity) {
    where(level: choice_complexity(complexity)) if [:easy, :average, :hard].include?(complexity) 
  }
  scope :by_title_category, ->(title) { joins(:category).where(categories: {title: title}) }

  private

  def self.choice_complexity(complexity)
    { easy: 0..1, average: 2..4, hard: 5..Float::INFINITY }[complexity]
  end
end
