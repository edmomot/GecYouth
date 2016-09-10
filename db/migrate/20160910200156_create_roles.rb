class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end

    create_join_table :users, :roles do |t|
      t.index [:user_id, :role_id]
      t.index [:role_id, :user_id]
    end
  end
end
