class AddColumnsNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users :login false
    change_column_null :users :password false
    change_column_null :tests :title false
    change_column_null :categories :title false
    change_column_null :questions :body false
  end
end
