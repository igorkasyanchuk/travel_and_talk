class Dashboard::UsersController < Dashboard::DashboardController
  
  def show
    redirect_to dashboard_path
  end
  
end