class MainController < ApplicationController
	
	def index
	end
	
	def query
		settings = YAML.load_file("#{Rails.root}/config/application.yml") rescue {}
		news_app_url = settings["#{Rails.env}"]["news.app.url"]
		ip_address = request.remote_ip
		query_ip_address = news_app_url
		query_news_path = '/api/news_feed?ip_address=' + ip_address
		path = query_ip_address + query_news_path
		result = RestClient.get path #('http://localhost:8000/api/news_feed?ip_address=127.0.0.1')
		json = JSON.parse(result)
		json["ip_address"] = ip_address
		render :text => json.to_json
	end
	
	def log
		settings = YAML.load_file("#{Rails.root}/config/application.yml") rescue {}
		news_app_url = settings["#{Rails.env}"]["news.app.url"]
		ip_address = request.remote_ip
		query_ip_address = news_app_url
		query_news_path = "/api/log?news_id=" + params["news_id"] + "&category=" + params["category"] + "&ip_address=" + ip_address
		path = query_ip_address + query_news_path
		result = RestClient.get(path)
		render :text => result.to_json
	end
end
