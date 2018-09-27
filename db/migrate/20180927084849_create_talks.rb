class CreateTalks < ActiveRecord::Migration[5.1]
  def change
    create_table :talks do |t|
      t.string :name
      t.text :description
      t.integer :category
      t.integer :place
      t.string :speaker
      t.datetime :start_time
      t.float :duration
    end
  end
end
