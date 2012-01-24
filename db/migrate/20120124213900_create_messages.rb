class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.text :content
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
  add_index :messages, :user_id
  add_index :messages, :topic_id
  add_index :messages, :created_at
  end

  def self.down
    drop_table :messages
  end
end
