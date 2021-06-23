class UsersController < ApplicationController
  def create
    user = User.new(
      first_name: params["first_name"],
      last_name: params["last_name"],
      email: params["email"],
    )
    if user.save
      render json: { message: user }
    else
      render json: { errors: user.errors.full_messages },
             status: 418
    end
  end

  def index
    users = User.all
    render json: { users: users.as_json }
  end

  def update
    input_value = params["id"]
    user = User.find(input_value)
    user.first_name = params["first_name"] || user.first_name
    user.last_name = params["last_name"] || user.last_name
    user.email = params["email"] || user.email
    if user.save
      render json: [user: user]
    else
      render json: { errors: user.errors.full_messages },
             status: 418
    end
  end

  def show
    input_value = params["id"]
    user = User.find(input_value)
    render json: { user: user.as_json }
  end
end
