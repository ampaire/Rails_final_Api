class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, index: true
      t.string :description
      t.string :image
      t.integer :price
      t.string :contact
      t.references :user
      t.timestamps
    end
  end
end
