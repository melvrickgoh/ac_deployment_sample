class CheckoutForm
  include ActiveModel::Model

  validates_presence_of :first_name, :last_name, :credit_card_number
  validate :credit_card_format
  validate :cart_is_not_empty

  attr_reader :user, :first_name, :last_name, :credit_card_number

  def initialize(user, params)
    @user = user
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @credit_card_number = params[:credit_card_number]
  end

  private

  def credit_card_format
    if !credit_card_number.is_a?(Integer)
      errors.add :credit_card_number, "is invalid"
    end
  end

  def cart_is_not_empty
    if user.shopping_cart_is_empty?
      errors.add :base, "Shopping cart is empty"
    end
  end

end
