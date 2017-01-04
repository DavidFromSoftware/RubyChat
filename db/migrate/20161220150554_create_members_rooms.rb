class CreateMembersRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :members_rooms do |t|
      t.integer :room_id
      t.timestamps
    end
    add_column :members_rooms, :members, :integer, array:true, default: []
  end
end
