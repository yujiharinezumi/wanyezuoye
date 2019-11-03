class Task < ApplicationRecord
  validates :name, presence: true
  validates :content,presence: true
  validates :deadline,presence: true
  
  enum status: {waiting: 0,working: 1,completed: 2}
  enum priority: {low: 0,medium: 1,heigh: 2}

  paginates_per 10
end
