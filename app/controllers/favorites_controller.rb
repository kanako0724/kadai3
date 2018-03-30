class FavoritesController < ApplicationController
    def index
        @user = current_user
        @favorites = @user.favorites.all
    end
    
    def create
        favorite = current_user.favorites.create(picture_id: params[:picture_id])
        redirect_to pictures_path,notice:"#{favorite.picture.user.name}さんのピクチャーをいいねしました"
    end
    
    def destroy
        favorite = current_user.favorites.find(params[:id])
        favorite.destroy
        redirect_to pictures_path,notice:"#{favorite.picture.user.name}さんのピクチャーをいいね解除しました"
    end
end
