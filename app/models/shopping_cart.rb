class ShoppingCart < ActiveRecord::Base

  belongs_to :user

  validates :item_ids, length: { minimum: 0 }

  def is_empty?
    item_ids.blank?
  end

  def add_items(ids)
    update(item_ids: item_ids + ids)
  end

  def remove_items(ids)
    update(item_ids: item_ids - ids)
  end

  def empty
    update(item_ids: [])
  end

end