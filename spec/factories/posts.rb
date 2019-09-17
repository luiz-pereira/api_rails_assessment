FactoryBot.define do
	factory :post do
    author { Faker::TvShows::Seinfeld.character  }
		id { Faker::Number.number(digits: 10) }
		authorId { Faker::Number.number(digits: 10)}
		likes { Faker::Number.positive(from: from = 500, to: to = 5000)}
		popularity { Faker::Number.positive(from: from = 500, to: to = 5000)}
		reads { Faker::Number.positive(from: from = 500, to: to = 5000)}
		tags {["tech", "geology"]}
  end
end

