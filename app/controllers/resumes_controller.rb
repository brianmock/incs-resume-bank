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
    end
    if @resume.save
      if @resume.teacher_id == nil
        redirect_to users_new_teacher_path(@user), notice: "Your #{@resume.name.downcase} has been uploaded."
      else
        redirect_to user_path(@user)
      end
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
