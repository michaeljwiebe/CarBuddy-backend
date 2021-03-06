class UsersController < ApplicationController
    def index

    end

    def sign_in
      user = User.where(username: sign_in_params[:username]).first

      if user != nil
        if user.password === sign_in_params[:password]
            user_json = user.as_json
            user_json[:avatar_url] = user.avatar.url
          render json: user_json
        end
      end
    end

  def create
    new_user = User.new(new_user_params)
    if new_user.save!
        p new_user.avatar.url
        render json: new_user
    end
  end

  def show
  end

  def update
      edited_user = User.find(params[:id])
      edited_user.username = params[:username]
      edited_user.password = params[:password]
      edited_user.name = params[:name]
      edited_user.address = params[:address]
      edited_user.zip = params[:zip]
      if edited_user.save!
          edited_user_json = edited_user.as_json
          render json: edited_user_json
      end
  end

  def update_image
      user = User.find(params[:id])
      user.update_attribute(:avatar, params[:data])
      render json: {avatar_url: user.avatar.url}
  end

  def upload_image
    user = User.last
    user.update_attribute(:avatar, params[:data])
    render json: {avatar_url: user.avatar.url}
  end

  def destroy
    User.find(params[:id]).destroy
  end

  private

  def new_user_params
    params.require(:data).permit(:name, :address, :zip, :username, :password)
  end

  def sign_in_params
    params.require(:data).permit(:username, :password)
  end
end
