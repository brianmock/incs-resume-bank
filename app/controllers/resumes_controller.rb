class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.teacher_id = session[:user_id]
    @user = User.find(session[:user_id])
    if @resume.save
      redirect_to user_path(@user), notice: "The resume #{@resume.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    @user = User.find(session[:user_id])
    redirect_to user_path(@user), notice: "The resume #{@resume.name} has been deleted."
  end

  private
  def resume_params
    params.require(:resume).permit(:name, :attachment)
  end
end
