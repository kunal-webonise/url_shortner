class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :slug
      t.integer :hits,  :default => 0

      t.timestamps
    end
  end
end
