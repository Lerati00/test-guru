class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :answer,   null: false
      t.boolean :correct, null: false, default: false

      t.timestamps
    end
  end
end
