class AlbumsController < ApplicationController
    before_action :set_album, only: %i[show]


    def index
        if current_user.status <= 0
            current_user.reset_status
            current_user.update(status: 100) 
        end
        @albums = Album.all
    end

    def new
        @album = Album.new
    end

    def show;end

    def create
        @album = current_user.albums.build(album_params)
        if @album.save
            redirect_to albums_path, success: 'アルバムを作成しました'
        else
            flash.now[:error] = "アルバムの作成に失敗しました"
            render :new, status: :unprocessable_entity
        end
    end

    private

    def album_params
        params.require(:album).permit(:title, :introduction, :album_image, :album_image_cache)
    end

    
    private

    def set_album
        @album = Album.find(params[:id])
    end

    

end
