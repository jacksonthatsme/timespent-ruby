class AddPublishedToShoots < ActiveRecord::Migration
  def change
    add_column :shoots, :is_published, :boolean
  end
end
