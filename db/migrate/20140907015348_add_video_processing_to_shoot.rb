class AddVideoProcessingToShoot < ActiveRecord::Migration
  def change
    add_column :shoots, :video_processing, :boolean, null: false, default: false
  end
end
