class CreateUserRelations < ActiveRecord::Migration
  def change
    create_table :user_relations do |t|
      t.string :request_user_id
      t.string :receiver_user_id
      t.string :request_status
      t.string :security

      t.timestamps
    end
  end
end
