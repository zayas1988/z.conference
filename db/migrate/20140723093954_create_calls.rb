class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :raw

      t.timestamps
    end
  end
end
