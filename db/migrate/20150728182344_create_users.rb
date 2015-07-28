class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_hash
      t.string :session_id # every time log in set up a random number in it using SecureRandom, this automatically expires after a period of time, every time you login, you create a new one.

      t.timestamps
    end
  end
end
