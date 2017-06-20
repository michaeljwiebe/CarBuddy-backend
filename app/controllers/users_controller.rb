class UsersController < ApplicationController
    def index

    end

    def sign_in
        user = User.where(username: sign_in_params[:username]).first

        if user != nil
          if user.password === sign_in_params[:password]
            render json: user
          end
        end
    end

  def create
      new_user = User.new(new_user_params)
      if new_user.save!
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

  def sign_in_params
      params.require(:data).permit(:username, :password)
  end
end
