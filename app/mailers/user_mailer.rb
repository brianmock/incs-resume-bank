class UserMailer < ApplicationMailer
  include SendGrid
  default from: '"Allison Jack" <AJack@incschools.org>'
  def teacher_email(user)
    @user = user
    @url = "http://www.teacherjobfair.org"
    mail(to:@user.email, subject: 'Thanks for submitting to the INCS Resume Bank')
  end

  def school_email(user)
    @user = user
    @url = "http://www.teacherjobfair.org"
    mail(to:@user.email, subject: 'Registration in progress for the INCS Resume Bank')
  end

  def steph_email(user)
    @user = user
    mail(to:'AJack@incschools.org', subject: 'New school leader signed up for resume bank')
  end

  def school_activated_email(user)
    @user = user
    @url = "http://www.teacherjobfair.org"
    mail(to:@user.email, subject: "Registration approved. Happy searching!")
  end

  def forgot_password(user, pass, url)
    @user = user
    @pass = pass
    @url = url
    mail(to:@user.email, subject: "Your password has been reset")
  end
end
