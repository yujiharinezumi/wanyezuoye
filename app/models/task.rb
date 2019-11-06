class Task < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :content,presence: true
  validates :deadline,presence: true

  enum status: {waiting: 0,working: 1,completed: 2}
  enum priority: {low: 0,medium: 1,heigh: 2}

  scope :name_search, -> (name) {where("name LIKE ?", "%#{name}%")}
  scope :status_search, -> (status) {where(status: status)}
  scope :priority_search, -> (priority) {where(priority: priority)}


  paginates_per 5
end
