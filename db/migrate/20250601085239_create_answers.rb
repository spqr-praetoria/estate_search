class CreateAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.references :lawyer, null: false, foreign_key: { to_table: :users }
      t.text :body
      t.integer :proposed_fee, default: 0, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end

    add_index :answers, :status
    add_index :answers, [ :lawyer_id, :status ]
    add_index :answers, [ :question_id, :created_at ]
  end
end
