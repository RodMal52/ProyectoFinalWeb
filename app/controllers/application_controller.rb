class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  

  def after_sign_in_path_for(resource)  #Authorization process CanCan and rolify
    unless current_account.roles.first.nil?
      case current_account.roles.first.name #Checks the role of current user
        when 'admin'  #If the role is admin it sends them to users_path, which is the pseudo admin screen
          rails_admin_path
        
        else #if there is no role, user is redirected to the root
          
          authenticated_root_path
      end
    else
        authenticated_root_path
    end
    
  end
end
