class Transaction < ActiveRecord::Base
  
  belongs_to :user

  validates :item_ids, length: { minimum: 1 }

  def self.create_from_cart(shopping_cart)
    create(user: shopping_cart.user, item_ids: shopping_cart.item_ids)
  end

end