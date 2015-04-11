class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :html
      t.integer :subject_id

      t.timestamps null: false
    end
  end
end
