class Task < ApplicationRecord
  has_many :statuses

  validates :name, presence: true
  validates :content,presence: true
    validates :deadline,presence: true
end
