class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def additional
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    if session[:user_id]
      @resume.teacher_id = session[:user_id]
      @user = User.find(session[:user_id])
      if @user.register == "jobfaironly"
        @resume.active = false
      else
        @resume.active = true
      end
    end
    if @resume.save
      redirect_to user_path(@user), notice: "Your #{@resume.name.downcase} has been uploaded."
    else
      render "new"
    end
  end

  def update
    @resume = Resume.find(params[:id])
    @user = User.find(@resume.teacher_id)
    @resume.active = !@resume.active
    if @resume.save
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user), notice: "Your #{@resume.name.downcase} could not be updated"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    @user = User.find(session[:user_id])
    redirect_to user_path(@user), notice: "Your #{@resume.name.downcase} has been deleted."
  end

  private
  def resume_params
    params.require(:resume).permit(:name, :attachment, :active)
  end
end
