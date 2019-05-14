class AdminAuthenticationController < ApplicationController
 layout 'admin_login'
 def admin_login_page; end	
 
 def admin_login_action
   admins = Admin.where(username: params[:username])
                .where(password: params[:password])
   if admins.present?
   	 admins.each do |admin|
       payload = {
       	 admin_id: admin.id
       } 
       
       jwt = JWT.encode(
         payload,
         Rails.application.secrets.secret_key_base
       )
       $response = jwt
     end
   else
     $response = nil
   end             
   render json: $response.to_json    
 end
end
