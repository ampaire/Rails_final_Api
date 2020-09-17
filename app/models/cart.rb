class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :items
  validates_presence_of :user_id, :item_id
end
