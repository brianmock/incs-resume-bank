class AdminController < ApplicationController
  before_filter :authorize, :except => [:new_teacher, :new_school]

  # GET /admin
  def index 
    @endorsements = Endorsement.all
    @licenses = License.all
    @organizations = Organization.all
    @positions = Position.all
    @subjects = Subject.all

    respond_to do |format|
      format.html { 
        render :index
      }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def authorize
    if !session[:user_id]
      redirect_to root_path
    end
    if session[:user_id]
      if User.find_by(id: session[:user_id]).access != "admin"
        redirect_to root_path
      end
    end
  end
end
