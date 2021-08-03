class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.string :comment
      t.bigint "movie_id", null: false
      t.bigint "list_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["list_id"], name: "index_bookmarks_on_list_id"
      t.index ["movie_id"], name: "index_bookmarks_on_movie_id"
    end
  end
end
