class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.integer :user_id
      t.integer :potential_match_id
      t.integer :status, default: 0
      t.integer :count, default: 0

      t.timestamps null: false
    end
  end
end
