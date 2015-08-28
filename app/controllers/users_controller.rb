class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if  @user.save!
      render :json => @user, serializer: UserSerializer
    else
      render :json => @user.errors
    end
  end

  private

  def user_params
    params.permit(:email, :api_token)
  end

end
