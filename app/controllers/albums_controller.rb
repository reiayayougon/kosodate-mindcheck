class AlbumsController < ApplicationController
    before_action :set_album, only: %i[show]
    before_action :find_album, only: %i[edit update destroy]

    def index
        @albums = Album.all
    end

    def new
        @album = Album.new
    end

    def show; end

    def create
        @album = current_user.albums.build(album_params)
        if @album.save
            redirect_to albums_path, success: t('defaults.message.created', item: Album.model_name.human)
        else
            flash.now[:error] = t('defaults.message.not_created', item: Album.model_name.human)
            render :new, status: :unprocessable_entity
        end
    end

    def edit; end
    
    def update
        if @album.update(album_params)
            redirect_to albums_path, success: t('defaults.message.updated', item: Album.model_name.human)
        else
            flash.now[:error] = t('defaults.message.not_updated', item: Album.model_name.human)
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @album.destroy!
        flash.now[:success] = t('defaults.message.deleted', item: Album.model_name.human)
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
