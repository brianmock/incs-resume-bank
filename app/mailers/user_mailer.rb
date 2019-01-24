class UserMailer < ApplicationMailer
  include SendGrid
  default from: '"Allison Jack" <AJack@incschools.org>'
  def teacher_email(user)
    @user = user
    @url = "http://www.teacherjobfair.org"
    mail(to:@user.email, subject: 'INCS Resume Bank Registration Confirmation')
  end
  def teacher_both_email(user)
    @user = user
    @url = "http://www.teacherjobfair.org"
    mail(to:@user.email, subject: 'INCS Job Fair & Resume Bank Registration Confirmation')
  end
  def teacher_fair_email(user)
    @user = user
    @url = "http://www.teacherjobfair.org"
    mail(to:@user.email, subject: 'INCS Job Fair Registration Confirmation')
  end

  def school_email(user)
    @user = user
    @url = "http://www.teacherjobfair.org"
    mail(to:@user.email, subject: 'Registration in progress for the INCS Resume Bank')
  end

  def steph_email(user)
    @user = user
    mail(to:'AJack@incschools.org', cc: 'alevybrown@incschools.org', subject: 'New school leader signed up for resume bank')
  end

  def school_activated_email(user)
    @user = user
    @url = "http://www.teacherjobfair.org"
    mail(to:@user.email, subject: "INCS Resume Bank Account Activated")
  end

  def forgot_password(user, pass, url)
    @user = user
    @pass = pass
    @url = url
    mail(to:@user.email, subject: "Your password has been reset")
  end
end
