class Sharing < ActiveRecord::Base
  validates :spiritual_life, :god_relationship, :family_relationship, :testimony_to_society, presence: true

  belongs_to :user
end
