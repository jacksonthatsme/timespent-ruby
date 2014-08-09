class CreateShoots < ActiveRecord::Migration
  def change
    create_table :shoots do |t|
      t.string :artist
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
