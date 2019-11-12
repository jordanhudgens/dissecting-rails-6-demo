class AddUniquenessIndexToFollowings < ActiveRecord::Migration[6.0]
  def change
    add_index :followings, [:follower_id, :followed_id], unique: true
  end
end
