class ConferencesUsers < ActiveRecord::Migration
def change
    create_table :conferences_users do |t|
      t.belongs_to :conference
      t.belongs_to :user
    end
  end
end
