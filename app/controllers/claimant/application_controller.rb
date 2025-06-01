class Claimant::ApplicationController < AuthController
  layout "claimant"
  before_action :authenticate_user!
end
