class User < ApplicationRecord
  include UniqueTokenGenerator

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum user_level: [:normal, :readonly_admin, :super_admin]

  has_one :shopping_cart
  has_many :transactions

  delegate :add_items, :remove_items, :empty, :is_empty?, to: :shopping_cart, prefix: true

  before_save :ensure_authentication_token, :ensure_cart_present

  def latest_transactions
    transactions.order(created_at: :desc)
  end

  private

  def ensure_cart_present
    if shopping_cart.nil?
      ShoppingCart.create(user: self, item_ids: [])
    end
  end

  def ensure_authentication_token
    generate_token_for :authentication_token, token_size: 16
  end

end
