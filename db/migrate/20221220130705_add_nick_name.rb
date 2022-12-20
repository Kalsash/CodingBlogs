class AddNickName < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string, default: "NewUser"
  end
end
