Rails.application.routes.draw do
	get 'api/ping' => 'api#ping'
	get 'api/posts' => 'api#posts'
end
