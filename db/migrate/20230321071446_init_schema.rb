class InitSchema < ActiveRecord::Migration[7.0]
  def change
    create_table "users" do |t|
      t.string "name"
      t.string "email"
      t.string :password_digest

      t.timestamps
    end
    create_table "posts" do |t|
      t.text "text"
      t.boolean "is_banned", default: false
      t.boolean "is_archived", default: false

      t.timestamps
    end

    add_reference :posts, :user, foreign_key: true
  end
end
