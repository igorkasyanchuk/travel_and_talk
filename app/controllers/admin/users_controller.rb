class Admin::UsersController < Admin::DashboardController
  
  def toggle_admin
    @user = resource
    @user.toggle_admin!
    redirect_to admin_users_path
  end
  
end