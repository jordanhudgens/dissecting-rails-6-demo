class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.bigint :follower_id, index: true
      t.bigint :followed_id, index: true

      t.timestamps
    end
  end
end
