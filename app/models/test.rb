class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', optional: true
  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.categories_with_title(title)
    Test.joins(:category)
        .where("categories.title = ?", title)
        .order(title: :desc)
        .pluck(:title)
  end
end
