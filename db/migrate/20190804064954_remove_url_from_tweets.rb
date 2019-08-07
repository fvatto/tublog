class RemoveUrlFromTweets < ActiveRecord::Migration[5.0]
  def change
    remove_column :tweets, :url, :string
  end
end
