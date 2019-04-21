class ApplicationController < ActionController::Base
 def products
   product = Product.all
 end

 def product_features	
   product_features = ProductFeature.all
 end 

 def announcements
   announcements = Announcement.all
 end

 helper_method :products
 helper_method :product_features
 helper_method :announcements
end
