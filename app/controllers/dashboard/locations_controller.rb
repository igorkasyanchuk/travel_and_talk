class Dashboard::LocationsController < Dashboard::DashboardController
  belongs_to :company
  
  def create
    create! do |format|
      format.js {}
    end
  end
  
  def destroy
    destroy! do |format|
      format.js {}
    end
  end
  
end