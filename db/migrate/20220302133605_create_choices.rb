class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.string :choice, null: false
      t.boolean :is_answer
      t.integer :word_id

      t.timestamps
    end
  end
end
