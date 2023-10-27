class ProfilesController < ApplicationController
    before_action :set_user, only: %i[edit update]

    def show; end

    def edit; end

    def update
        if @user.update(user_params)
            redirect_to profile_path
            flash[:success] = t('defaults.message.updated', item: t('profiles.show.title'))
            
        else
            flash.now[:error] = t('defaults.message.not_updated', item: t('profiles.show.title'))
            render :edit
        end
    end

  private
    
    def set_user
        @user = User.find(current_user.id)
    end

    def user_params
        params.require(:user).permit(:name, :introduction, :avatar, :avatar_cache)
    end
end
