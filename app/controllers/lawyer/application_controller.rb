class Lawyer::ApplicationController < AuthController
  layout "lawyer"
  before_action :authenticate_user!
end
