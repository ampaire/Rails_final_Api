class Item < ApplicationRecord
  has_many :carts, dependent: :destroy
  belongs_to :user
  validates_presence_of :name, :description, :price, :contact, :image
  validates_uniqueness_of :description
  mount_uploader :image, ImageUploader
end
