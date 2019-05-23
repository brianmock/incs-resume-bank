class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @user.access == "teacher"
        redirect_to user_path(@user), notice: 'Thank you for logging in to the INCS Online Resume Bank site. Please review your information below and make any desired updates (scroll down and click "Edit Information"). Any active documents and your updated Job Seeker Details will be accessible to charter school leaders.'
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
