class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :num

      t.timestamps
    end
  end
end
