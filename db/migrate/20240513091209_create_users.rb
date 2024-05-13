class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.datetime :last_login_at
      t.string :first_name
      t.string :last_name
      t.string :monobank_token

      t.timestamps
    end
  end
end
