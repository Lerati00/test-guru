class AddRuleToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :rule_type, :string, null: false
    add_column :badges, :rule_value, :string, null: false
  end
end
