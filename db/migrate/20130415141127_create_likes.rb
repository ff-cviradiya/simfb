class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :post_id
      t.string :post_type
      t.string :user_id
      t.string :security

      t.timestamps
    end
  end
end
