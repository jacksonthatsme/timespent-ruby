class AddShootImageToShoots < ActiveRecord::Migration
  def change
    add_column :shoots, :shoot_image, :string
  end
end
