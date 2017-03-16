class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment_text, null: false
      t.integer :user_id, null: false
      t.references :votable, polymorphic: true, index: true

      t.timestammps null: false
    end
  end
end
