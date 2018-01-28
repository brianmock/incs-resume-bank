class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, :except => [:new_teacher, :new_school]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def getreset() end

  def reset() end

  def register
    @current_user = User.find(session[:user_id])
    if @current_user.register2018 == 'bank' || @current_user.register2018.nil?
      @current_user.register2018 = 'both'
      @current_user.save
      redirect_to user_path(@current_user), notice: 'You have been registered for the 2018 INCS Teacher Job Fair'
    else
      redirect_to user_path(@current_user), notice: 'You have already registered for the 2018 INCS Teacher Job Fair'
    end

  end

  def sendpass
    if User.find_by(email: params['email'])
      @user = User.find_by(email: params['email'])
      @pass = (0...8).map { (65 + rand(26)).chr }.join
      @user.update_attribute(:password, @pass)
      @url = 'www.teacherjobfair.org/users/reset'
      UserMailer.forgot_password(@user, @pass, @url).deliver_now
      redirect_to root_path, notice: 'You have been sent an email with instructions for resetting your password'
    else
      redirect_to users_getreset_path, notice: 'Email address has not been registered'
    end
  end

  def password_reset
    if User.find_by(email: params['email'])
      @user = User.find_by(email: params['email'])
      p params
      if @user.authenticate(params['temp_pass'])
        @user.update_attribute(:password, params['password'])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to users_reset_path, notice: 'Temp password does not match for email address entered'
      end
    else
      redirect_to users_reset_path, notice: 'Email address was not found'
    end
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

  def export
    @users = params["users"]
    send_data @users.as_csv
  end

  def show_all_schools
    if params[:search]
      @users = User.school_search(params[:search])
    else 
      @users = User.where('access' => 'school').order(:school)
    end

    respond_to do |format|
      format.html { render :schools_index }
      format.csv {send_data User.school_to_csv(@users), :type => 'text/csv; charset=iso-8859-1; header=present', :disposition => "attachment; filename=INCS_results-#{Time.now.strftime('%d-%m-%Y_%H-%M-%S')}.csv"}
    end
  end

  def show_all_teachers
    if params["filter"]
      case params["filter"]
      when 'bank-only'
        @users = User.where('access' => 'teacher').select {|user| (user.register2017 == 'bank') || (user.register == 'bank') || (user.register2018 == 'bank')}
        @header = 'Candidates only registered with Resume Bank'
        @filter = 'bank-only'
      when '2018-job-fair'
        @users = User.where('access' => 'teacher').select {|user| user.register2018 == 'both' || user.register2018 == 'jobfaironly'}
        @header = 'All Candidates registered for 2018 Teacher Job Fair'
        @filter = '2018-job-fair'
      when '2017-job-fair'
        @users = User.where('access' => 'teacher').select {|user| user.register2017 == 'both' || user.register2017 == 'jobfaironly'}
        @header = 'All Candidates registered for 2017 Teacher Job Fair'
        @filter = '2017-job-fair'
      # when '2016-job-fair'
      #   @users = User.where('access' => 'teacher').select {|user| user.register == 'both' || user.register == 'jobfaironly'}
      #   @header = 'All Candidates registered for 2016 Teacher Job Fair'
      #   @filter = '2016-job-fair'
      when '2018-job-fair-only'
        @users = User.where('access' => 'teacher').select {|user| user.register2018 == 'jobfaironly'}
        @header = 'All Candidates only registered for 2018 Teacher Job Fair (no resume bank)'
        @filter = '2018-job-fair-only'
      when '2017-job-fair-only'
        @users = User.where('access' => 'teacher').select {|user| user.register2017 == 'jobfaironly'}
        @header = 'All Candidates only registered for 2017 Teacher Job Fair (no resume bank)'
        @filter = '2017-job-fair-only'
      # when '2016-job-fair-only'
      #   @users = User.where('access' => 'teacher').select {|user| user.register == 'jobfaironly'}
      #   @header = 'All Candidates only registered for 2016 Teacher Job Fair (no resume bank)'
      #   @filter = '2016-job-fair-only'
      end
    elsif params[:search]
      @users = User.teacher_search(params[:search])
      @header = "Results for #{params[:search]}"
      @filter = 'none'
    else
      @users = User.where('access' => 'teacher')
      @header = 'All Candidates'
      @filter = 'none'
    end

    render :teachers_index
  end

  def download_teachers
    case params["filter"]
    when 'bank-only'
      @users = User.where('access' => 'teacher').select {|user| user.register2017 == 'bank' || user.register2018 == 'bank' || user.register == 'bank'}
      @header = 'Candidates only registered with Resume Bank'
      @filter = 'bank-only'
    when '2017-job-fair'
      @users = User.where('access' => 'teacher').select {|user| user.register2017 == 'both' || user.register2017 == 'jobfaironly'}
      @header = 'All Candidates registered for 2017 Teacher Job Fair'
      @filter = '2017-job-fair'
    when '2018-job-fair'
      @users = User.where('access' => 'teacher').select {|user| user.register2018 == 'both' || user.register2018 == 'jobfaironly'}
      @header = 'All Candidates registered for 2018 Teacher Job Fair'
      @filter = '2018-job-fair'
    # when '2016-job-fair'
    #   @users = User.where('access' => 'teacher').select {|user| user.register == 'both' || user.register == 'jobfaironly'}
    #   @header = 'All Candidates registered for 2016 Teacher Job Fair'
    #   @filter = '2016-job-fair'
    when '2017-job-fair-only'
      @users = User.where('access' => 'teacher').select {|user| user.register2017 == 'jobfaironly'}
      @header = 'All Candidates only registered for 2017 Teacher Job Fair (no resume bank)'
      @filter = '2017-job-fair-only'
    when '2018-job-fair-only'
      @users = User.where('access' => 'teacher').select {|user| user.register2018 == 'jobfaironly'}
      @header = 'All Candidates only registered for 2018 Teacher Job Fair (no resume bank)'
      @filter = '2018-job-fair-only'
    # when '2016-job-fair-only'
    #   @users = User.where('access' => 'teacher').select {|user| user.register == 'jobfaironly'}
    #   @header = 'All Candidates only registered for 2016 Teacher Job Fair (no resume bank)'
    #   @filter = '2016-job-fair-only'
    else
      @users = User.where('access' => 'teacher')
      @header = 'All Candidates'
      @filter = 'none'
    end
    respond_to do |format|
      format.html { send_data User.to_csv(@users), :type => 'text/csv; charset=iso-8859-1; header=present', :disposition => "attachment; filename=INCS_results-#{Time.now.strftime('%d-%m-%Y_%H-%M-%S')}.csv"}
      format.csv {send_data User.to_csv(@users), :type => 'text/csv; charset=iso-8859-1; header=present', :disposition => "attachment; filename=INCS_results-#{Time.now.strftime('%d-%m-%Y_%H-%M-%S')}.csv"}
    end
  end

  def search
    @users = User.all.select {|user| user.is_active?}
    if params["years"] != "Any"
      @users = @users.select {|user| user.years.to_i >= params["years"].to_i}
    end
    if params["positions"]
      @users = @users.select {|user| ((user.positions.pluck(:title) & params["positions"]).empty? == false)}
    end
    if params["subjects"]
      @users = @users.select {|user| ((user.subjects.pluck(:subject) & params["subjects"]).empty? == false)}
    end
    if params["grade_pref"] != "Any"
      @users = @users.select {|user| user.grade_pref == params["grade_pref"]}
    end
    if params["registered"] == "Yes"
      @users = @users.select {|user| user.register2018 == "both" || user.register2018 == 'jobfaironly'}
    end
    if params["location_pref"] == "Chicago"
      @users = @users.select {|user| user.location_pref == "Chicago"}
    elsif params["location_pref"] == "Non-Chicago, Greater Illinois"
      @users = @users.select {|user| user.location_pref == "Non-Chicago, Greater Illinois"}
    elsif params["location_pref"] == "Chicago or Greater Illinois"
      @users = @users.select {|user| user.location_pref == "Chicago or Greater Illinois"}
    end

    respond_to do |format|
      format.html { 
        @users = @users.paginate(page: params[:page], per_page: 25)
        render :index
      }
      format.csv {
        send_data User.to_csv(@users), :type => 'text/csv; charset=iso-8859-1; header=present', :disposition => "attachment; filename=INCS_results-#{Time.now.strftime('%d-%m-%Y_%H-%M-%S')}.csv"
      }
    end
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
    @user.email = @user.email.downcase
    respond_to do |format|
      if @user.access == "teacher"
        #save references
        if params["sources"]
          params["sources"].each do |source|
            next if source == ""
            @user.sources << Source.find_or_create_by(source_name: source)
          end
        end
        if params["add-sources"]
          more_sources = params["add-sources"].split(",").map(&:strip)
          more_sources.each do |source|
            source_name = source.split(" ").map do |word| word.downcase.capitalize end.join(" ")

            @user.sources << Source.find_or_create_by(source_name: source_name)
          end
        end
      end
      if @user.save
        # save uploaded resume
        if @user.access == 'teacher'
          @resume = Resume.new
          # save licenses
          if params["licenses"]
            params["licenses"].each do |lic|
              next if lic == ""
              @user.licenses << License.find_by(name: lic)
            end
          end
          if params["add-licenses"]
            more_licenses = params["add-licenses"].split(",").map(&:strip)
            more_licenses.each do |lic|
              name = lic.split(" ").map do |word| word.downcase.capitalize end.join(" ")

              @user.licenses << License.find_or_create_by(name: name)
            end
          end
          #save positions
          if params["positions"]
            params["positions"].each do |pos|
              next if pos == ""
              @user.positions << Position.find_or_create_by(title: pos)
            end
          end
          if params["add-positions"]
            more_positions = params["add-positions"].split(",").map(&:strip)
            more_positions.each do |pos|
              title = pos.split(" ").map do |word| word.downcase.capitalize end.join(" ")

              @user.positions << Position.find_or_create_by(title: title)
            end
          end
          #save endorsements
          if params["endorses"]
            params["endorses"].each do |endo|
              next if endo == ""
              @user.endorsements << Endorsement.find_by(name: endo)
            end
          end
          if params["add-endorses"]
            more_endorses = params["add-endorses"].split(",").map(&:strip)
            more_endorses.each do |endo|
              name = endo.split(" ").map do |word| word.downcase.capitalize end.join(" ")

              @user.endorsements << Endorsement.find_or_create_by(name: name)
            end
          end
          #save subjects
          if params["subs"]
            params["subs"].each do |sub|
              next if sub == ""
              @user.subjects << Subject.find_by(subject: sub)
            end
          end
          if params["add-subs"]
            more_subs = params["add-subs"].split(",").map(&:strip)
            more_subs.each do |sub|
              subject = sub.split(" ").map do |word| word.downcase.capitalize end.join(" ")

              @user.subjects << Subject.find_or_create_by(subject: subject)
            end
          end
          #save organizations
          if params["orgs"]
            params["orgs"].each do |org|
              next if org == ""
              @user.organizations << Organization.find_by(name: org)
            end
          end
          if params["add-orgs"]
            more_orgs = params["add-orgs"].split(",").map(&:strip)
            more_orgs.each do |org|
              name = org.split(" ").map do |word| word.downcase.capitalize end.join(" ")

              @user.organizations << Organization.find_or_create_by(name: name)
            end
          end
        end
        session[:user_id] = @user.id
        if @user.access == "teacher"
          UserMailer.teacher_email(@user).deliver_now
          format.html { redirect_to new_resume_path(@resume) }
        elsif @user.access == "pending"
          UserMailer.steph_email(@user).deliver_now
          UserMailer.school_email(@user).deliver_now
          format.html { redirect_to root_path }
          format.html { redirect_to root_path, notice: 'Your profile was successfully created and you should receive an email shortly with further instructions.' }
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
        if params["licenses"]
          @user.licenses.destroy_all
          params["licenses"].each do |lic|
            next if lic == ""
            @user.licenses << License.find_by(name: lic)
          end
        end
        if params["add-licenses"]
          more_licenses = params["add-licenses"].split(",").map(&:strip)
          more_licenses.each do |lic|
            name = lic.split(" ").map do |word| word.downcase.capitalize end.join(" ")

            @user.licenses << License.find_or_create_by(name: name)
          end
        end
        #save positions
        if params["positions"]
          @user.positions.destroy_all
          params["positions"].each do |pos|
            next if pos == ""
            @user.positions << Position.find_or_create_by(title: pos)
          end
        end
        if params["add-positions"]
          more_positions = params["add-positions"].split(",").map(&:strip)
          more_positions.each do |pos|
            title = pos.split(" ").map do |word| word.downcase.capitalize end.join(" ")

            @user.positions << Position.find_or_create_by(title: title)
          end
        end
        #save endorsements
        if params["endorses"]
          @user.endorsements.destroy_all
          params["endorses"].each do |endo|
            next if endo == ""
            @user.endorsements << Endorsement.find_by(name: endo)
          end
        end
        if params["add-endorses"]
          more_endorses = params["add-endorses"].split(",").map(&:strip)
          more_endorses.each do |endo|
            name = endo.split(" ").map do |word| word.downcase.capitalize end.join(" ")

            @user.endorsements << Endorsement.find_or_create_by(name: name)
          end
        end
        #save subjects
        if params["subs"]
          @user.subjects.destroy_all
          params["subs"].each do |sub|
            next if sub == ""
            @user.subjects << Subject.find_by(subject: sub)
          end
        end
        if params["add-subs"]
          more_subs = params["add-subs"].split(",").map(&:strip)
          more_subs.each do |sub|
            subject = sub.split(" ").map do |word| word.downcase.capitalize end.join(" ")

            @user.subjects << Subject.find_or_create_by(subject: subject)
          end
        end
        #save organizations
        if params["orgs"]
          @user.organizations.destroy_all
          params["orgs"].each do |org|
            next if org == ""
            @user.organizations << Organization.find_by(name: org)
          end
        end
        if params["add-orgs"]
          more_orgs = params["add-orgs"].split(",").map(&:strip)
          more_orgs.each do |org|
            name = org.split(" ").map do |word| word.downcase.capitalize end.join(" ")

            @user.organizations << Organization.find_or_create_by(name: name)
          end
        end
        #save references
        if params["sources"]
          @user.sources.destroy_all
          params["sources"].each do |source|
            next if source == ""
            @user.sources << Source.find_or_create_by(source_name: source)
          end
        end
        if params['more-sources']
          more_sources = params['more_sources'].split(',').map(&:strip)
          more_sources.each do |source|
            source_name = source.split('  ').map do |word| word.downcase.capitalize end.join(' ')
            @user.sources << Sources.find_or_create_by(source_name: source_name)
          end
        end
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
    if @user.id == session[:user_id]
      session[:user_id] = nil
      @user.destroy
      respond_to do |format|
        format.html { redirect_to '/', notice: 'User was successfully deleted.' }
        format.json { head :no_content }
      end
    else
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_pending_url, notice: 'User was successfully deleted.' }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by(id: params[:id])
    if @user
      @user
    else
      redirect_to root_path
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :email, :password, :access,
                                 :prefix, :first_name, :last_name,
                                 :phone_number, :street, :street_second,
                                 :city, :state, :zip, :country,
                                 :register, :register2017, :register2018,
                                 :il_licensed, :licenses, :degree, :major,
                                 :masters_concentration, :endorses,
                                 :previous, :subs, :relocation,
                                 :orgs, :additional, :years, :grade_pref,
                                 :positions, :school, :resume_id,
                                 :location_pref, :sources)
  end

  def authorize
    if session[:user_id]
      if User.find_by(id: session[:user_id]).access == "pending"
        redirect_to root_path
      end
    end
  end
end
