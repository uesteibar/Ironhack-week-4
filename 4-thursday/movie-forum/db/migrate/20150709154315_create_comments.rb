class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer   :movie_id
      t.string    :username
      t.text      :content

      t.timestamps null: false
    end
  end
end
