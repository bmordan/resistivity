class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :user_id
      t.string :site
      t.date :date
      t.string :surveyors
      t.integer :gridx
      t.integer :gridy
      t.timestamps
    end
  end
end
