class RenameLoginToNameInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column(:users, :login, :name)
  end
end
