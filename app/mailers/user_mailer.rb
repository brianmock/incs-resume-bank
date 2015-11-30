class UserMailer < ApplicationMailer
  default from: "info@incs.org"
  def teacher_email(user)
    @user = user
    @url = "http://www.incsresumebank.org"
    mail(to:@user.email, subject: 'Welcome to the INCS Resume Bank')
  end

  def school_email(user)
    @user = user
    @url = "http://www.incsresumebank.org"
    mail(to:@user.email, subject: 'Welcome to the INCS Resume Bank')
  end

  def school_activated_email(user)
    @user = user
    @url = "http://www.incsresumebank.org"
    mail(to:@user.email, subject: "Your account has been activated")
  end
end
