class CreateGamesUsers < ActiveRecord::Migration
  def change
    create_table :games_users do |t|
      t.belongs_to :user
      t.belongs_to :game
    end
  end
end
