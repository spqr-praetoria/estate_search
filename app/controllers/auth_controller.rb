class AuthController < ApplicationController
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path
    elsif resource.lawyer?
      lawyer_dashboard_path
    else
      claimant_dashboard_path
    end
  end
end
