class SessionsController < ApplicationController
    skip_before_action :check_logged_in, only: :create

    def create
        user = User.find_or_create_from_auth_hash(auth_hash)
        if user.save
            log_in user
            flash[:success] = "ログインしました"
        else 
            flash[:danger] = "ログインに失敗しました"
        end
        redirect_to root_path
    end
        
    def destroy
        log_out
        redirect_to root_path,  status: :see_other, success: 'ログアウトしました'
        
    end
    
    private
    
    def auth_hash
        request.env['omniauth.auth']
    end
end
