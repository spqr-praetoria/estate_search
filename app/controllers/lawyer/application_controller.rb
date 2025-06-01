class Lawyer::ApplicationController < ApplicationController
  layout "lawyer"
  before_action :authenticate_user!
end
