require 'rails_helper'

RSpec.describe 'API', type: :request do
  let!(:posts) { create_list(:post, 10) }
  let(:post_id) { post.first.id }

  describe 'GET with correct tag' do
    before { get '/api/posts?tags=tech' }

    it 'returns posts' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(28)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET when no tags are included ' do
    before { get '/api/posts' }

    it 'returns an error message' do
      expect(response.body).to match(/Tags parameter is required/)
    end

    it 'returns status code 400' do
      expect(response).to have_http_status(400)
    end
	end

	describe 'GET when improper sortBy is included ' do
    before { get '/api/posts?tags=tech,history&sortBy=wrong' }

    it 'returns an error message' do
      expect(response.body).to match(/sortBy parameter is invalid/)
    end

    it 'returns status code 400' do
      expect(response).to have_http_status(400)
    end
  end

end

