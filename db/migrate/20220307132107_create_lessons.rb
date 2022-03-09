class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :result

      t.timestamps
    end
  end
end
