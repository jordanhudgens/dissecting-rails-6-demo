class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :editor], multiple: false)                                      ##
  ############################################################################################ 

  extend FriendlyId
  friendly_id :username, use: :slugged
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :username

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

  def is_following? user_id
    self.followers.where(id: user_id).any?
  end

  private

    def auto_follow_account
      Following.create(
        follower_id: self.id,
        followed_id: self.id
      )
    end
end
