class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :check_logged_in
    add_flash_types :success, :info, :warning, :danger, :error

    def check_logged_in
        return if current_user
        
        redirect_to root_path, error: t('defaults.message.require_login')
    end
end
