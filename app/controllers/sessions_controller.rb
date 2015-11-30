class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @user.access == "teacher"
        redirect_to user_path(@user)
      elsif @user.access == "school"
        redirect_to school_path(@user)
      elsif @user.access == "pending"
        redirect_to root_path
      elsif @user.access == "admin"
        redirect_to root_path
      end
    else
      @message = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end