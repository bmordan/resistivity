class CreateGrids < ActiveRecord::Migration
  def change
    create_table :grids do |t|
      t.string :row
      t.integer :rownumber
      t.references :survey      
      t.timestamps
    end
  end
end
