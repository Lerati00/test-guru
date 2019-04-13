class ChangePassedDefaultColumnInTestPasseges < ActiveRecord::Migration[5.2]
  def change
    change_column_default :test_passages, :passed, false
  end
end
