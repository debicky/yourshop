class ApplicationController < ActionController::Base

  def check_admin
    unless current_user.try(:admin?)
        redirect_to '/', :alert => "Don't have permission!"
    end
  end
end
