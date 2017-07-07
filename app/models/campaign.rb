# キャンペーンクラス
class Campaign < ApplicationRecord
  # 有効なキャンペーン一覧を返す
  has_and_belongs_to_many :cuepoints
  
  #start以降じゃないとendを使えない

  validates :name, presence: true, uniqueness: true, length: { in: 5..20 }
  validates :movie_url, presence: true, length: { in: 5..100 }
  validates_datetime :start_at
  validates_datetime :end_at, on_or_after: :start_at  
  #  - 対象のCue Pointと紐付いている。
  #  - キャンペーンが開始していて、終了する前。
  #  - Resultのスタート数(count_start)がキャンペーンの制限(limit_start)以内。
  # @param [Cuepoint, #read] cuepoint キャンペーンの対象となっている Cue Point
  # @return [Array] 該当キャンペーンの配列
  def self.current_avaliable(cuepoint)
    ccc = cuepoint.campaigns.
      where("start_at <= '#{Time.now}' AND end_at >= '#{Time.now}'")
    return ccc.reject do |campaign|
      result = Result.where(campaign: campaign, cuepoint: cuepoint).first
      !result.blank? && result.count_start >= campaign.limit_start
    end
  end
end
