class ThemeReflection < ActiveRecord::Base
  validates :question, presence: true

  belongs_to :user
end
