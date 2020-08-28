class AddPheneAndImageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mobile_number, :string
    add_column :users, :image, :string
  end
end
