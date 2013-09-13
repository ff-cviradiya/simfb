class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :description
      t.string :user_id
      t.string :security

      t.timestamps
    end
  end
end
