class UsersController < ApplicationController
    def index
     user = User.where(username: params[:username]).first
     if user != nil
       if user.password === params[:password]
         session[:user_id] = user.id
         p session[:user_id]
         render json: user
       end
     end
    end

  def create
      new_user = User.new(new_user_params)
      if new_user.save!
          session[:user_id] = new_user.id
          render json: new_user
      end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def new_user_params
      params.require(:data).permit(:name, :address, :zip, :username, :password)
  end
end
