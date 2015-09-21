class Reward < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :cost, presence: true
end
