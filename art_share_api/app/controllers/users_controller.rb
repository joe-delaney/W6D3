#      Prefix Verb   URI Pattern                Controller#Action
#       users GET    /users(.:format)           users#index
#             POST   /users(.:format)           users#create
#   users_new GET    /users/new(.:format)       users#new
#   edit_user GET    /users/:id/edit(.:format)  users#edit
#        user GET    /users/:id(.:format)       users#show
# update_user PATCH  /users/:id(.:format)       users#update
#             DELETE /users/:id(.:format)       users#destroy


class UsersController < ApplicationController
  def index
    if params[:username]
      render json: User.search(params[:username])
    else
      @users = User.all
      render json: @users
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to update_user_url(@user)
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
      
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: @user
  end

  def favorite_artworks
    render json: User.find(params[:id]).favorite_artworks
  end

  def favorite_shared_artworks
    render json: User.find(params[:id]).favorite_shared_artworks
  end

  def collections 
    render json: User.find(params[:id]).collections
  end

  def collection_names
    render json: User.find(params[:id]).collection_names
  end

  def artworks_in_collection 
    render json: User.find(params[:id]).artworks_in_collection(params[:collection_name])
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end