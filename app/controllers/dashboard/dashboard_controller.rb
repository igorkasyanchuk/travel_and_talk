class Dashboard::DashboardController < InheritedResources::Base
  respond_to :html, :xml, :json
  before_filter :require_user
  layout 'dashboard'
  
  def welcome
  end
  
end