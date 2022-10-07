class AddCommentToFeeds < ActiveRecord::Migration[6.1]
  def change
    add_column :feeds, :comment, :text
  end
end
