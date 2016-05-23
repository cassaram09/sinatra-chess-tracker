class CreateDraws < ActiveRecord::Migration
  def change
    create_table :draws do |t|
      t.belongs_to :game
      t.belongs_to :user
    end
  end
end
