# frozen_string_literal: true

RailsAdmin.config do |config|
   
   config.authorize_with do
    redirect_to "/users/sign_in" unless current_user.is_admin?
   end  
 
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    all
    charts
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
