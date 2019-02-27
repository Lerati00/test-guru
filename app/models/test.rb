class Test < ApplicationRecord
  belongs_to :category
  has_many :completed_tests

  def self.categories_with_title(title)
    Test.joins(:category)
        .where("categories.title = ?", title)
        .order(title: :desc)
        .pluck(:title)
  end
end
