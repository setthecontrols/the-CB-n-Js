class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question_text, null: false
      t.integer :user_id, null: false

      t.timestammps null: false
    end
  end
end
