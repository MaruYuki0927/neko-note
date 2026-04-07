class ChangeCatIdToAllowNullInPosts < ActiveRecord::Migration[7.1]
  def change
    change_column_null :posts, :cat_id, true
  end
end
