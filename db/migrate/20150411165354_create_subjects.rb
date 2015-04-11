class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.boolean :has_wiki_page
      t.string :wiki_page_link
      t.string :bio
      t.string :wiki_create_link

      t.timestamps null: false
    end
  end
end
