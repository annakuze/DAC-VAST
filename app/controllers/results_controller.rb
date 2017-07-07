# レポート関連コントローラ
class ResultsController < ApplicationController
  # 結果一覧表示
  def index
    @results = Result.all.order(:campaign_id, :cuepoint_id)
  end

  # 結果追加
  def record
    # TODO
    @result = Result.find_or_initialize_by(campaign_id: params[:campaign], cuepoint_id: params[:cuepoint])
    logger.debug @result.inspect
    if params[:event] == 'start'
      @result.count_start += 1
    elsif params[:event] == 'complete'
      @result.count_complete += 1
    end
    @result.save!
    send_data(Base64.decode64('R0lGODlhAQABAPAAAAAAAAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=='),
      type: 'image/gif', disposition: 'inline')
  end
end
