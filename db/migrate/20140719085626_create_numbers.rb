class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.string :num
      t.integer :user_id
      t.boolean :active

      t.timestamps
    end
  end
end
