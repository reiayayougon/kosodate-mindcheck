class AlbamsController < ApplicationController
    def index
        @albams = Albam.all
        if current_user.status == 0
            current_user.reset_status
            current_user.update(status: 100) 
        end
    end

    def new
        @albam = Albam.new
    end

    def create
        @albam = current_user.albams.build(albam_params)
        if @albam.save
            redirect_to albams_path, success: '投稿を作成しました'
        else
            flash.now[:error] = "投稿の作成に失敗しました"
            render :new, status: :unprocessable_entity
        end
    end

    private

    def albam_params
        params.require(:albam).permit(:title, :introduction, :albam_image, :albam_image_cache)
    end

    


end