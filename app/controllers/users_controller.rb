class UsersController < ApplicationController

    def create
        @user = User.create(user_params)
        if !@user.valid?
          flash[:errors] = @user.errors.full_messages
          redirect_to "/"
        else
          session[:user_id] = @user.id
          flash[:success]="Welcome!!!"
          redirect_to "/songs"
        end
    end
    def songs
        @user = User.find(current_user)
        @songs = Song.all
    end

    def create_song
        @song = Song.new(title: params[:title], artist: params[:artist], user_id: session[:user_id])
        if !@song.valid?
          flash[:errors] = @song.errors.full_messages
          redirect_to "/songs"
        else
          @song.save
          flash[:success]="New song was added!!!"
          redirect_to "/songs"
        end
      
    end

    def add
        @user = User.find(current_user_id)
        @song = Song.find(params[:song_id])
        @list = List.new(user: @user, song: @song)
        @list.save
        redirect_to "/songs"
    end

    def show
        @song = Song.find(params[:song_id])
        lists = List.where(song:@song)
        @users = User.all
    end

    def list
        @user = User.find(params[:id]) 
        @songs = Song.all
    end

    private
    def  user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end



