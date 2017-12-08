class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	@news = News.all
end
