# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def products
    Product.all
  end

  def product_features
    ProductFeature.all
  end

  def announcements
    Announcement.order("date DESC")
  end

  def wall_of_power
     WallOfPower.order("created_at DESC")
  end

  helper_method :products
  helper_method :product_features
  helper_method :announcements
  helper_method :wall_of_power
end
