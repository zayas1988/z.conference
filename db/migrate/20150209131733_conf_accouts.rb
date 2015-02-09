class ConfAccouts < ActiveRecord::Migration
  def change
    create_table :accounts_conferences do |t|
      t.belongs_to :account
      t.belongs_to :conference   
    end
  end
end
