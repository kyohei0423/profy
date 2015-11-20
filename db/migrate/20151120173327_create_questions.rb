class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :text
      t.integer :group_id
      t.integer :user_id
      t.timestamps
    end
  end
end
