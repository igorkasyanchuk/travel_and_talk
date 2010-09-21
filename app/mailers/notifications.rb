class Notifications < ActionMailer::Base
  default_url_options[:host] = 'b2m.heroku.com'
  default :from => 'B2M <mail@b2m.com>'

  def forgot_password(user)
    @edit_password_reset_url = edit_password_reset_url(user.perishable_token)
    mail :to => user.email
  end

end
