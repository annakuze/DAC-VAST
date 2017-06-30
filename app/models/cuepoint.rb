# キューポイントクラス
class Cuepoint < ApplicationRecord
  # TODO
  has_and_belongs_to_many :campaigns
  
  validates :name, presence: true, uniqueness: true, length: { in: 5..20 }
end
