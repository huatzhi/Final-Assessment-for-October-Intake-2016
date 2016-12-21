class CreateAds < ActiveRecord::Migration[5.0]
  def change
    create_table :ads do |t|
      t.string :title, null: false
      t.float :price, null: false
      t.integer :location, null: false
      t.integer :condition, null: false
      t.string :contact_name, null: false
      t.string :phone_number
      t.string :email, null:false
      t.string :description

      t.timestamps null: false
    end
  end
end
