class ApiController < ApplicationController
	require 'json'
	require 'net/http'
	require 'net/ping'

	ATTRIBS = ["id","author","authorId","likes","popularity","reads","tags"]
	DIRECT = ["desc", "asc"]

	def ping
		hatchways_server = Net::Ping::External.new('hatchways.io')
		if hatchways_server.ping?
			response = "{\"success\": true}"
		end
		render json: response, status: 200
	end

	def posts
		if !params[:tags]
			posts_json_response = "{\"error\": \"Tags parameter is required\"}"
			response_status = 400
		else
			unless sort_by_valid? && direction_valid?
				posts_json_response = "{\"error\": \"sortBy parameter is invalid\"}"
				response_status = 400
			else
				tags_array = params[:tags].split(',')
				posts_hash={}
				posts_hash["posts"]=[]
				Post.delete_all #this will be changed later for when using a cache of posts
				tags_array.each do |tag|
					api_url = URI("https://hatchways.io/api/assessment/blog/posts?tag=#{tag}")
					tag_response = JSON.parse(Net::HTTP.get(api_url))
					tag_response["posts"].each do |post|
						@post = Post.where(post).first_or_create
					end
				end
				posts_json_response = Post.all.order("#{params['sortBy']} #{params['direction']}")
				response_status = 200
			end
		end
		render json: posts_json_response, status: response_status
	end

private

	def sort_by_valid?
		!params[:sortBy] || ATTRIBS.include?(params[:sortBy])
	end

	def direction_valid?
		return true if !params['direction']
		!!params[:sortBy] && DIRECT.include?(params['direction'])
	end

end
