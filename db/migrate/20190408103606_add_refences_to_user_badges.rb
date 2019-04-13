class AddRefencesToUserBadges < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_badges, :badge, foreign_key: true
    add_reference :user_badges, :user,  foreign_key: true
  end
end
