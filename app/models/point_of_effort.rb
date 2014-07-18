class PointOfEffort < ActiveRecord::Base
  validates :title, :description, :due_date, presence: true

  belongs_to :user
end
