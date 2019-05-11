# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def products
    Product.all
  end

  def product_features
    ProductFeature.all
  end

  def announcements
    Announcement.all
  end

  helper_method :products
  helper_method :product_features
  helper_method :announcements
end
