class TopsController < ApplicationController
  skip_before_action :check_logged_in, only: :index
    before_action :set_user, only: %i[index]

    def index

        if logged_in? && @user.status == 0 
            redirect_to categories_index_path, success: 'ステータスを回復しました'
        end
    end
    
    private

    def set_user
        if logged_in?
            @user = User.find(current_user.id)
        end
    end
end
