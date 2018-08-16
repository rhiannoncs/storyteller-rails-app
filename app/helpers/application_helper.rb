module ApplicationHelper

	def header_links
		if authenticated_user?
			link_to("Dashboard", dashboard_path(current_user.id)) +
			' ' +
			link_to("Log Out", logout_path, method: :post)
		else
			link_to("Sign Up", new_user_path) +
			' ' +
			(render partial: "sessions/form")
		end
	end
end
