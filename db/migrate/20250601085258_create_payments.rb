class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true
      t.integer :amount, default: 0, null: false
      t.integer :status, default: 0, null: false
      t.datetime :approved_at

      t.timestamps
    end

    add_index :payments, :status
    add_index :payments, :approved_at
    add_index :payments, [ :user_id, :status ]
    add_index :payments, [ :answer_id, :status ]
  end
end
