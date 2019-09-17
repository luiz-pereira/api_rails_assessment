module JsonResult

	def json_result(objects_array)
		render json: objects_array
	end

end