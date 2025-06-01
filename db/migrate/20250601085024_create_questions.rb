class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.integer :category, default: 0, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end

    add_index :questions, :category
    add_index :questions, :status
    add_index :questions, [ :user_id, :created_at ]
  end
end
