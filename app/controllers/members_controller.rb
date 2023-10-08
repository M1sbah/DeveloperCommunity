class MembersController < ApplicationController
	before_action :set_user, only: [:show, :edit_description, :update_description, :edit_user_details, :update_user_details, :connections]

	def show
		@connections = Connection.where(" user_id = ? OR connected_user_id = ?", @user.id, @user.id).where( status: "accepted")
		@muture_connections = get_connection(current_user).intersection(get_connection(@user))
	end

	def edit_user_details
	end

	def update_user_details
		if @user.update(user_params)
			render_turbo_stream('replace', 'user-details', 'members/user_details', {user: @user} )
		# respond_to do |format|
		# 		format.turbo_stream {render turbo_stream: turbo_stream.replace('user-details', partial: 'members/user_details', locals: {user: @user})}
		# 	end
		end
	end


	def edit_description
	end

	def update_description
		if @user.update(about: params[:user][:about])
			render_turbo_stream('replace', 'member-description', 'members/member_description', {user: @user})
		# respond_to do |format| 
		# 		format.turbo_stream { render turbo_stream: turbo_stream.replace('member-description', partial: 'members/member_description', locals: {user: @user})}
		# 	end
		end

		# respond_to do |format|
		# 	if @user.update(about: params[:user][:about])
		# 	  format.turbo_stream do
		# 	    render turbo_stream: [
		# 	      turbo_stream.replace('member-description', partial: 'members/member_description', locals: {user: @user}),
		# 	      turbo_stream.append('badge-about',partial: 'members/badge_about', locals: {user: @user})
		# 	    ]
		# 	  end
		# 	end
		# end
	end


	def connections
		# @requested_connections = Connection.includes(:requested).where(user_id: params[:id], status: 'accepted')
		# @received_connections = Connection.includes(:received).where(connected_user_id: params[:id], status: 'accepted')
		# @total_connections = @requested_connections.count + @received_connections.count
		
		
		@connected_users = if params[:mutual_connections].present?
							mutually_connected_ids = get_connection(current_user).intersection(get_connection(@user))
								User.where(id: mutually_connected_ids.to_set)
							else
								User.where(id: get_connection(@user).to_set)
							end
		@total_connections = @connected_users.count
		@connected_users=@connected_users.page(params[:page]).per(10)
	end


	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :country, :city, :state, :pincode, :profile_title)
	end

	def get_connection(user)
		@requested_connections = Connection.includes(:requested).where(user_id: user.id, status: 'accepted')
		@received_connections = Connection.includes(:received).where(connected_user_id: params[:id], status: 'accepted')
		@total_connections = @requested_connections.pluck(:connected_user_id) + @received_connections.pluck(:user_id)
	end


end