class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references  :item,                    null: false, foreign_key: true
      t.references  :users,                    null: false, foreign_key: true


      t.timestamps
    end
  end
end
