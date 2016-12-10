class CheckoutController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user

  def checkout
    form = CheckoutForm.new(current_user, checkout_params)
    if form.valid?
      transaction = Transaction.create_from_cart(current_user.shopping_cart)
      current_user.shopping_cart_empty
      render json: transaction
    else
      render json: { errors: form.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def status
    render json: { status: "in_progress" }
  end

  private

  def checkout_params
    params.permit(:first_name, :last_name, :credit_card_number)
  end

end
