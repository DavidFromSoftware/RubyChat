class AddMembersRoom < ActiveRecord::Migration[5.0]
  def change
  	add_column :chat_rooms, :members, :integer, array:true, default: []
  end
end
