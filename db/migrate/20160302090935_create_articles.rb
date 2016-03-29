class CreateArticles < ActiveRecord::Migration
  def up
      drop_table :articles
      
      create_table :articles do |t|
      t.string   "title"
    	t.text     "text"
    	t.integer  "user_id"
    	t.datetime "created_at",  null: false
    	t.datetime "updated_at",  null: false

      t.timestamps null: false
    end
  end

  def change
    add_column :article, :expired, :boolean, default: false
  end

end
