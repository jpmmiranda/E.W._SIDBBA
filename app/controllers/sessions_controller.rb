class SessionsController < ApplicationController
	

	def create
			user = User.find_by(email: params[:session][:email].downcase)
			if user && user.authenticate(params[:session][:password])
			# Log the user in and redirect to the user's show page.
			redirect_to '/login_home'

			else
				# Create an error message.
				render 'new'
			end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end
end
