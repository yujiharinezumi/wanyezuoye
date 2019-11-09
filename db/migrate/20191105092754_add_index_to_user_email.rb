class AddIndexToUserEmail < ActiveRecord::Migration[5.2]
  def change
     add_index :users, :email, unique: true


      before_validation { email.downcase! }
      has_secure_password
  end
end
