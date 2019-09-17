class CreatePosts < ActiveRecord::Migration[5.2]
  def change
		create_table :posts, id: false do |t|
			t.string :author
			t.integer :authorId
			t.integer :id
			t.integer :likes
			t.decimal :popularity
			t.integer :reads
			t.string :tags
    end
  end
end
