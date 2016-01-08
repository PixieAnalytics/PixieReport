class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :ip
      t.datetime :arrival
      t.datetime :departure
      t.string :clicks
      t.string :country
      t.string :city
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
