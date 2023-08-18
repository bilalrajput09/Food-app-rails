class CreateTableRecipe < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :preparation_time
      t.string :cooking_time
      t.string :description
      t.boolean :public, default: true
      t.integer :user_id
      t.timestamps
    end
  end
end
