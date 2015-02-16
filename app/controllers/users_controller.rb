class UsersController < ApplicationController
	before_action :admin, only: :show

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	private
		def admin
			@user = current_user
			unless user_signed_in? && @user.admin == true
				redirect_to root_path
				flash[:alert] = "You do not have permission to access this page."
			end
		end
end
