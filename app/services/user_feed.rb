class UserFeed
  def initialize user
    @user = user
  end

  def call
    if @user
      ids = @user.following.pluck(:id)
      Guide.where(user_id: ids)
    else
      Guide.last(20)
    end
  end
end
