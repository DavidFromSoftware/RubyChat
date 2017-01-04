class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :chat_rooms, dependent: :destroy
	has_many :messages, dependent: :destroy

	def name
  		email.split('@')[0]
	end

	def rooms
		myRooms= []
		rooms= {}
		ChatRoom.all.each do |room|
			room.members.each do |member|
				if member == self.id 
					room.members.each do |member|
						rooms[:otherMembers] = User.find(member) if member != self.id && User.find_by(id: member).present?
					end
					if rooms[:otherMembers]
						rooms[:room] = room
						myRooms << rooms
					end
				end
				rooms= {}
			end
		end
		return myRooms
	end


end
