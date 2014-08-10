class AddVideoToShoots < ActiveRecord::Migration
  def change
    add_column :shoots, :video, :string
  end
end
