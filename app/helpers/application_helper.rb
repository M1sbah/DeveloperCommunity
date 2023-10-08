module ApplicationHelper

    def get_connection_status(user)
        return nil if current_user == user
        
        # con = current_user.connections.find_by(connected_user_id: user.id) || user.connections.find_by(connected_user_id: current_user)
        # con.status
        # Connection.where("(user_id = ? AND connected_user_id = ?) OR (user_id = ? AND connected_user_id = ?)",user.id, current_user.id, current_user.id, user.id).last.status
        current_user.my_connection(user).last.status
    end

    def muture_connection(user)
        get_connection(current_user).intersection(get_connection(user))
    end

    def get_connection(user)
		requested_connections = Connection.includes(:requested).where(user_id: user.id, status: 'accepted')
		received_connections = Connection.includes(:received).where(connected_user_id: user.id, status: 'accepted')
		total_connections = requested_connections.pluck(:connected_user_id) + received_connections.pluck(:user_id)
	end


    # def get_the_receiver(user_id)
    #     User.find(user_id)
    # end

    # def get_the_requester(user_id)
    #     User.find(user_id)
    # end
    
end
