class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :categories_nav
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def invalid_cart
    session[:order_id] = nil
    logger.error "Error"
    redirect_to root_path, notice: 'Invalid cart'
  end


  def check_admin
    unless current_user.try(:admin?)
        redirect_to '/', :alert => "Don't have permission!"
    end
  end

  def categories_nav
    @categories = Category.all
  end

end
