class CreateDrawsUsers < ActiveRecord::Migration
  def change
    create_table :draws_users do |t|
      t.belongs_to :user
      t.belongs_to :draw
    end
  end
end
