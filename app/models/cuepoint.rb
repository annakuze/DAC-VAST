# キューポイントクラス
class Cuepoint < ApplicationRecord
  # TODO
  has_and_belongs_to_many :campaigns
end
