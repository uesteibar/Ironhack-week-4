class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :amount

      t.timestamps null: false
    end
  end
end
