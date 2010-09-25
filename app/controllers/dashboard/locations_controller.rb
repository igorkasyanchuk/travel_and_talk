class Dashboard::LocationsController < Dashboard::DashboardController
  belongs_to :company
  
  def create
    create! do |format|
      format.js {}
    end
  end
  
  def update
    @location = resource
    @company = @location.company
    if @location.update_attributes(params[:location])
      flash[:notice] = "Location successfully updated."
      redirect_to [:dashboard, current_user, @location.company]
    else
      render :edit
    end
  end
  
  def destroy
    destroy! do |format|
      format.js {}
    end
  end
  
end