class PicturesController < ApplicationController
    before_action :plz_login
    before_action :set_picture,only:[:show,:edit,:update,:destroy]
    
    def index
        @pictures = Picture.all
    end
    
    def new
        if params[:back]
            @picture = Picture.new(picture_params)
        else
            @picture = Picture.new
        end
    end
    
    def show
        @favorite = current_user.favorites.find_by(picture_id: @picture.id)
    end
    
    
    def confirm
        @picture = Picture.new(picture_params)
        @picture.user_id = current_user.id
        render 'new' if @picture.invalid?
    end
    
    def create
        @picture = Picture.new(picture_params)
        @picture.user_id = current_user.id
        @picture.picture.retrieve_from_cache! params[:cache][:picture]
        if @picture.save
            PostConfirmMailer.post_confirm_mail(@picture).deliver
            redirect_to pictures_path,notice:"投稿しました"
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @picture.update(picture_params)
            redirect_to pictures_path,notice:"更新しました"
        else
            render 'edit'
        end
    end
    
    def destroy
        @picture.destroy
        redirect_to pictures_path,notice:"削除しました"
    end
    
    private
    def plz_login
        unless logged_in? then
            redirect_to new_session_path
        end
    end
    
    def picture_params
        params.require(:picture).permit(:comment,:picture,:picture_cache)
    end
    
    def set_picture
        @picture = Picture.find(params[:id])
    end
end
