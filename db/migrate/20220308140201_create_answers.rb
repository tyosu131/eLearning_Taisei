class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :lesson_id
      t.integer :word_id
      t.integer :choice_id

      t.timestamps
    end
  end
end
