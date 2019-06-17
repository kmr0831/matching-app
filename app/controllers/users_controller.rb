class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(21)
  end

  def show
    @user = User.find(params[:id])
    @relationship = Relationship.new
    @room_id = message_room_id(current_user, @user)
    @messages = Messege.recent_in_room(@room_id)
  end
  
  def following
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
  
  def matchers
   @user = User.find(params[:id])
   @users = @user.matchers
   render 'matchers'
  end
  
  def message_room_id(first_user, second_user)
    first_id = first_user.id.to_i
    second_id = second_user.id.to_i
    if first_id < second_id
      "#{first_user.id}-#{second_user.id}"
    else
      "#{second_user.id}-#{first_user.id}"
    end
  end
  
end
