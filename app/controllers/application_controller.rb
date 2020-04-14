class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :categories_nav


  def check_admin
    unless current_user.try(:admin?)
        redirect_to '/', :alert => "Don't have permission!"
    end
  end

  def categories_nav
    @categories = Category.all
  end

end
