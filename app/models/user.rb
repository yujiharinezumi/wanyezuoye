class User < ApplicationRecord
  has_many :tasks
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :password, presence: true, length: { minimum: 6 },on: :new
  has_secure_password
  # before_destroy :must_not_destroy_last_admin
  # before_destroy @user.admin < 1
  # after_destroy :must_not_destroy_last_admin
  private

  def must_not_destroy_last_admin
    throw(:abort)
    User.where(admin:true).count < 1
    # throw(:abort) if (tasks.user.admin < 1)
      # errors.add :base,"admin0人まで削除することができません"
  end
end
