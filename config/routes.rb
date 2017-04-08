Rails.application.routes.draw do
	
	root 'main#index'
	
	# ============= News PlugIn routes =======================
	get '/query', :controller => 'main', :action => 'query'
	get '/log', :controller => 'main', :action => 'log'
	# ========================================================
	
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
