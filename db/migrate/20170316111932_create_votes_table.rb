class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :value, null: false
      t.integer :user_id, null: false
      t.references :votable, polymorphic: true, index: true

      t.timestampts null: true
    end
  end
end
