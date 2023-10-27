class SessionsController < ApplicationController
    skip_before_action :check_logged_in, only: :create

    def create
        user = User.find_or_create_from_auth_hash(auth_hash)
        if user.save
            log_in user
            redirect_to start_questions_path, success: t('.success')
            
        else 
            flash[:error] =  t('.fail')
            redirect_to root_path
        end
    end
        
    def destroy
        log_out
        redirect_to root_path, success: t('.success')
    end
    
  private
    
    def auth_hash
        request.env['omniauth.auth']
    end
end
