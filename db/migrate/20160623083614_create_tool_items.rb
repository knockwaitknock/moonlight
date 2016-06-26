class CreateToolItems < ActiveRecord::Migration
  def change
    create_table :tool_items do |t|
      t.string :name
      t.integer :category_id
      t.integer :price
      t.integer :required_skill
      t.string :type
    end
  end
end