class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :bio
      t.string :image

      t.timestamps null: false
    end
  end
end
