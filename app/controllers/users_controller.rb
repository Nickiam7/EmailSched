class UsersController < ApplicationController
	before_action :right_user?, only: :show
	before_action :authenticate_user!, only: :show


	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@emails = @user.emails
		@emails_approved = @user.emails.approved.paginate(page: params[:page], per_page: 4)
		@emails_pending = @user.emails.pending
	end


	private
		def admin?
			@user = current_user
			unless user_signed_in? && @user.admin?
				redirect_to root_path
				flash[:danger] = "You do not have permission to access this page."
			end
		end

		def right_user?
			@user = User.find(params[:id])
			unless @user == current_user || user_signed_in? && current_user.admin?
				flash[:danger] = "Sorry, You do not have permission to access this page."
				redirect_to root_url
			end
		end
end
