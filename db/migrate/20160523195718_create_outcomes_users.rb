class CreateOutcomesUsers < ActiveRecord::Migration
  def change
    create_table :outcomes_users do |t|
      t.belongs_to :outcome, index: true
      t.belongs_to :user, index: true
    end
  end
end
