class TopsController < ApplicationController
    skip_before_action :check_logged_in
    before_action :set_user, only: %i[index top]

    def index
        return unless logged_in? && @user.status == 0 
        redirect_to albums_path
    end

    def privacy; end

    def terms; end
    
  private

    def set_user
        return unless logged_in?
        @user = User.find(current_user.id)
    end
end
