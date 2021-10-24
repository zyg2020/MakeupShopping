class ApplicationController < ActionController::Base
  helper_method :return_ransack, :cms_pages, :return_tags, :return_malls
  def return_ransack
    @q = Product.ransack(params[:q])
  end

  def return_tags
    Tag.order(:name)
  end

  def return_malls
    Mall.order(:name)
  end

  def cms_pages
    Page.all
  end
end
