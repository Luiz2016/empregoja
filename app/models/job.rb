class Job < ActiveRecord::Base
  belongs_to :company
  validates :title, :category_id, :description, :location, presence: true
  belongs_to :category
end
