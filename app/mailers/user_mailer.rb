class UserMailer < ApplicationMailer
  include SendGrid
  default from: '"Stephanie Arias" <sarias@incschools.org>'
  def teacher_email(user)
    @user = user
    @url = "http://www.teacherjobfair.org"
    mail(to:@user.email, subject: 'Thanks for submitting. See you at the job fair?')
  end

  def school_email(user)
    @user = user
    @url = "http://www.teacherjobfair.org"
    mail(to:@user.email, subject: 'Thank you for registering + 2016 Teacher Job Fair!')
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
