class Task < ApplicationRecord
  validates :name, presence: true
  validates :content,presence: true
    validates :deadline,presence: true
end
