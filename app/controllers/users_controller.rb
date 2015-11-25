class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, :except => [:new]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    redirect_to root_path unless params[:id].to_i == session[:user_id].to_i
    if User.find_by(id: session[:user_id])
      @resumes = User.find_by(id: session[:user_id]).resumes
    end
  end

  # GET /users/new
  def new_teacher
    @user = User.new
  end

  def new_school
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    redirect_to root_path unless params[:id].to_i == session[:user_id].to_i
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        #save licenses
        params["licenses"].each do |lic|
          @user.licenses << License.find_by(name: lic)
        end
        #save positions
        params["positions"].each do |pos|
          @user.positions << Position.find_by(title: pos)
        end
        #save endorsements
        params["endorses"].each do |endo|
          @user.endorsements << Endorsement.find_by(name: endo)
        end
        #save subjects
        params["subs"].each do |sub|
          @user.subjects << Subject.find_by(subject: sub)
        end
        #save organizations
        params["orgs"].each do |org|
          @user.organizations << Organization.find_by(name: org)
        end
        session[:user_id] = @user.id
        format.html { redirect_to user_path(@user) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(id: params[:id])
      if @user
        @user
      else
        status '404'
        redirect '/'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :access, :prefix, :first_name, :last_name, :phone_number, :street, :street_second, :city, :state, :zip, :country, :register, :il_licensed, :licenses, :degree, :major, :masters_concentration, :endorses, :previous, :subs, :relocation, :orgs, :additional, :years, :grade_pref, :positions, :school)
    end

    def authorize

    end
end
