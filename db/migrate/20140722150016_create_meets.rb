class CreateMeets < ActiveRecord::Migration
  def change
    create_table :meets do |t|
      t.boolean :ok

      t.timestamps
    end
    end
  @meets = Meet.create(:ok => false)
end
