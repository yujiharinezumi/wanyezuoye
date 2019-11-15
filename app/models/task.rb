class Task < ApplicationRecord
  belongs_to :user
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings

  validates :name, presence: true
  validates :content,presence: true
  validates :deadline,presence: true

  enum status: {waiting: 0,working: 1,completed: 2}
  enum priority: {low: 0,medium: 1,heigh: 2}

   scope :name_search, -> (name) {
     next if name.blank?
     where("name LIKE ?", "%#{name}%")
   }
   scope :status_search, -> (status) {
     next if status.blank?
     where(status: status)}

   scope :priority_search, -> (priority) {
     next if priority.blank?
     where(priority: priority)}

  scope :label_search, ->(label_ids){
    next if label_ids.blank?
    #ラベルがある時(false)
    joins(:labels).where(labels: { id: label_ids }).group(:id)}

  paginates_per 5
end
