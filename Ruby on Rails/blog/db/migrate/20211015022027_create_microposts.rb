class CreateMicroposts < ActiveRecord::Migration[6.1]
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    # 索引：按照发布时间倒序检索某个用户发布的所有微博
    add_index :microposts, [:user_id, :created_at]
  end
end
