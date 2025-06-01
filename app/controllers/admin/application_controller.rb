class Admin::ApplicationController < AuthController
  layout "admin"
  before_action :authenticate_user!
end
