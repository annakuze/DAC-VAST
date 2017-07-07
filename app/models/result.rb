# 結果クラス
class Result < ApplicationRecord
  # TODO
  after_initialize :zero_clear
  belongs_to :campaign
  belongs_to :cuepoint

  private
    # 初期化
    def zero_clear
      # TODO
      # 広告読み込み開始(count_start)の初期化 ||= 
      # 広告読み込み完了(count_complete)の初期化　||= 
      self.count_start ||= 0
      self.count_complete ||= 0
    end
end
