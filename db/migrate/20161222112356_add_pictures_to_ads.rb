class AddPicturesToAds < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :pictures, :json
  end
end
