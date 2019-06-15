class AddFavoriteSingerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :favorite_singer, :string
  end
end
