class CreateAnswersTable < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer_text, null: false
      t.boolean :best_answer, default: false
      t.integer :user_id, null: false
      t.integer :question_id, null: false

      t.timestamps null: false
    end
  end
end
