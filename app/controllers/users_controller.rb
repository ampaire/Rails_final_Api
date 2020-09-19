class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  def create
    user = User.new(user_params)
    user.admin = true if ['sample@email.com', 'example@email.com'].include?(user.email)
    user.save!
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  def update
    current_user.update!(user_params)
    json_response(current_user)
  end

  def show
    @result = ''
    if current_user.admin?
      @items = Item.all
      @result = admin_profile(@items)
    else
      @carts = current_user.carts.preload(:item)
      @result = user_profile(@carts)
    end
    json_response(@result)
  end

  private

  def admin_profile(items)
    liked = items.reject { |el| el.carts.empty? }
    income = liked.sum(&:price)
    result = {
      details: current_user,
      liked: liked,
      income: income
    }
    result
  end

  def user_profile(carts)
    items = carts.collect(&:item)
    expense = items.sum(&:price)
    result = {
      details: current_user,
      carts: items,
      expense: expense
    }
    result
  end

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :image
    )
  end
end
