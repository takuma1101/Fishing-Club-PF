class CreateFish < ActiveRecord::Migration[6.1]
  def change
    create_table :fish do |t|

       t.string :title
       t.string :body
       t.integer :customer_id

      t.timestamps
    end
  end
end
