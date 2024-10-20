class AddNicknameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :first_name, :string
    add_column :users, :given_name, :string
    add_column :users, :birth_date, :string
    add_column :users, :given_name_reading, :string
    add_column :users, :first_name_reading, :string
  end
end
