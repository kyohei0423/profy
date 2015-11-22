class CreateFeedContents < ActiveRecord::Migration
  def change
    create_table :feed_contents do |t|

      t.timestamps null: false
    end
  end
end
