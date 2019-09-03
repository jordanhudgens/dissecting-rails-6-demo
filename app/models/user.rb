class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :guides, dependent: :destroy

  has_many :users_are_following_this_user, class_name:  "Following",
                                           foreign_key: "followed_id",
                                           dependent:   :destroy

  has_many :followers, through: :users_are_following_this_user,
                       source: :follower

  has_many :this_user_is_following_other_users, class_name:  "Following",
                                                foreign_key: "follower_id",
                                                dependent:   :destroy

  has_many :following, through: :this_user_is_following_other_users,
                       source: :followed

  after_create :auto_follow_account

  private

    def auto_follow_account
      Following.create(
        follower_id: self.id,
        followed_id: self.id
      )
    end
end
