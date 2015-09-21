class Reward < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :cost, presence: true
end
