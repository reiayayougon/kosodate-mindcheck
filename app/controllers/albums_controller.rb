class AlbumsController < ApplicationController
    before_action :set_album, only: %i[show]
    before_action :find_album, only: %i[edit update destroy]

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

    def show; end

    def create
        @album = current_user.albums.build(album_params)
        if @album.save
            redirect_to albums_path, success: 'アルバムを作成しました'
        else
            flash.now[:error] = "アルバムの作成に失敗しました"
            render :new, status: :unprocessable_entity
        end
    end

    def edit; end
    
    def update
        if @album.update(album_params)
            flash[:success] = 'アルバムを更新しました'
            redirect_to albums_path
        else
            flash.now[:danger] = "更新に失敗しました"
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @album.destroy!
        flash.now[:success] = "アルバムを削除しました"
    end

  private

    def album_params
        params.require(:album).permit(:title, :introduction, :album_image, :album_image_cache)
    end

    def set_album
        @album = Album.find(params[:id])
    end

    def find_album
        @album = current_user.albums.find(params[:id])
    end
end
