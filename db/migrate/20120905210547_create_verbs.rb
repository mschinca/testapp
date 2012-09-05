class CreateVerbs < ActiveRecord::Migration
  def change
    create_table :verbs do |t|
      t.string :infinite
      t.string :present
      t.string :past_simple
      t.string :present_perfect

      t.timestamps
    end
  end
end
