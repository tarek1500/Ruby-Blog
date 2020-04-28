class ApplicationController < ActionController::Base
	before_action :authenticate_request

	attr_reader :current_user

	# rescue_from CanCan::AccessDenied do |exception|
	# 	respond_to do |format|
	# 		format.json { head :forbidden, content_type: 'text/html' }
	# 		format.html { redirect_to main_app.root_url, notice: exception.message }
	# 		format.js   { head :forbidden, content_type: 'text/html' }
	# 	end
	# end

	private
	def authenticate_request
		@current_user = AuthorizeApiRequest.call(request.headers).result
		render json: { error: 'Not Authorized' }, status: 401 unless @current_user
	end
end