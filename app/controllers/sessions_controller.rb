class SessionsController < Devise::SessionsController
	before_action :load_categories

	private

	def load_categories
		@categories = Category.all
		@categories = @categories.order(:name)
	end
end