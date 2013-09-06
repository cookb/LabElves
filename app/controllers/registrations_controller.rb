class RegistrationsController < Devise::RegistrationsController

  def create
    lat_long = get_lat_lng(sign_up_params[:location])
    sign_up_params[:latitude] = lat_long[0]
    sign_up_params[:longitude] = lat_long[1] 
    super
  end

  def update
    new_location = account_update_params[:location]
    if new_location != resource.location
      lat_long = get_lat_lng(new_location)
      account_update_params[:latitude] = lat_long[0]
      account_update_params[:longitude] = lat_long[1] 
    end
    super
  end
end