# Cue Point コントローラ
class CuepointsController < ApplicationController
  # 一覧
  def index
    @cuepoints = Cuepoint.all
  end

  # 新規
  def new
    @cuepoint = Cuepoint.new
  end

  # 作成
  def create
    # TODO
  end

  # 編集
  def edit
    # TODO
  end

  # 更新
  def update
    # TODO
  end

  # 削除
  def destroy
    # TODO
  end

  private
    # キューポイント用パラメータ
    def cuepoint_params
      # TODO
    end
end
