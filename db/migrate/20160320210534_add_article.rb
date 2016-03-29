class AddArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :expired, :boolean, default: false
  end
end
