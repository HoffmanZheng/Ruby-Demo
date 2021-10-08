class AddUniqueIndexUserEmail < ActiveRecord::Migration[6.1]
  def change
    # the unique index in db is case sensitive, which is not we want
    add_index :users, :email, unique: true
  end
end
