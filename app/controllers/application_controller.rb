class ApplicationController < ActionController::Base
  helper_method :return_ransack
  def return_ransack
    @q = Product.ransack(params[:q])
  end
end
