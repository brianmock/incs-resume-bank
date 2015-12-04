class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, :except => [:new_teacher, :new_school]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if User.find(session[:user_id]).access == "teacher"
      redirect_to root_path unless params[:id].to_i == session[:user_id].to_i
    end
    if User.find(params[:id]).access == "school" || User.find(params[:id]).access == "pending"
      redirect_to root_path
    end
    @current_user = User.find(session[:user_id])
    if User.find_by(id: params[:id])
      @resumes = User.find_by(id: params[:id]).resumes
    end
  end

  # GET /users/new
  def new_teacher
    @user = User.new
  end

  def new_school
    @user = User.new
  end

  def search
    p params
    if params["years"]
      @users = User.where(years: params["years"]).select {|user| ((user.positions.pluck(:title) & params["positions"]).empty? == false) && ((user.subjects.pluck(:subject) & params["subjects"]).empty? == false)}
    else
      @users = User.all.select {|user| ((user.positions.pluck(:title) & params["positions"]).empty? == false) && ((user.subjects.pluck(:subject) & params["subjects"]).empty? == false)}
    end
    @users = @users.select {|user| user.is_active?}
    render :index
  end

  def pending
    @users = User.where(access: "pending")
    render :pending_index
  end

  # GET /users/1/edit
  def edit
    redirect_to root_path unless params[:id].to_i == session[:user_id].to_i
  end

  # Put /users/1/activate
  def activate
    @user = User.find_by(id: params[:id])
    if @user.access == "pending"
      @user.access = "school"
      if @user.save
        UserMailer.school_activated_email(@user).deliver_now
      end
    end
    redirect_to users_pending_path
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        #save uploaded resume
        if @user.access == "teacher"
          @resume = Resume.new
          #save licenses
          if params["licenses"]
            params["licenses"].each do |lic|
              @user.licenses << License.find_by(name: lic)
            end
          end
          #save positions
          if params["positions"]
            params["positions"].each do |pos|
              @user.positions << Position.find_by(title: pos)
            end
          end
          #save endorsements
          if params["endorses"]
            params["endorses"].each do |endo|
              @user.endorsements << Endorsement.find_by(name: endo)
            end
          end
          #save subjects
          if params["subs"]
            params["subs"].each do |sub|
              @user.subjects << Subject.find_by(subject: sub)
            end
          end
          #save organizations
          if params["orgs"]
            params["orgs"].each do |org|
              @user.organizations << Organization.find_by(name: org)
            end
          end
        end
        session[:user_id] = @user.id
        if @user.access == "teacher"
          UserMailer.teacher_email(@user).deliver_now
          format.html { redirect_to new_resume_path(@resume) }
        elsif @user.access == "pending"
          UserMailer.school_email(@user).deliver_now
          format.html { redirect_to root_path }
        end
        format.json { render :show, status: :created, location: @user }
      else
        if @user.access == "teacher"
          format.html { render :new_teacher }
        elsif @user.access == "pending"
          format.html { render :new_school}
        end

        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
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
      params.require(:user).permit(:username, :email, :password, :access, :prefix, :first_name, :last_name, :phone_number, :street, :street_second, :city, :state, :zip, :country, :register, :il_licensed, :licenses, :degree, :major, :masters_concentration, :endorses, :previous, :subs, :relocation, :orgs, :additional, :years, :grade_pref, :positions, :school, :resume_id)
    end

    def authorize
      if session[:user_id]
        if User.find_by(id: session[:user_id]).access == "pending"
          redirect_to root_path
        end
      end
    end
end
