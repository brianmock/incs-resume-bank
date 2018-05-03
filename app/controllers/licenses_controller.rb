class LicensesController < ApplicationController
  before_filter :authorize

  def destroy
    @lic = License.find(params[:id])
    @lic.destroy
    redirect_to admin_path
  end

  private 

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
