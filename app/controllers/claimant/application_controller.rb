class Claimant::ApplicationController < ApplicationController
  layout "claimant"
  before_action :authenticate_user!
end
