class AddTitleUniqueToBadges < ActiveRecord::Migration[5.2]
  def change
    add_index :badges, :title, unique: true
  end
end
