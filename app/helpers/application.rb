module ApplicationHelpers

	def current_maker
		@current_maker ||= maker.get(session[:maker_id]) if session[:maker_id]
	end

end