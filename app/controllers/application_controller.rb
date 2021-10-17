class ApplicationController < ActionController::Base
  helper_method :return_ransack, :cms_pages
  def return_ransack
    @q = Product.ransack(params[:q])
  end

  def cms_pages
    Page.all
  end
end
