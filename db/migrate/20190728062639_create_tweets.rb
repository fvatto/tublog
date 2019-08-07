class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.text    :text, null: true
      t.text    :url, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
