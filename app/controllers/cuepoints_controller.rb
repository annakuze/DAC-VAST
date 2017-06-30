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
    @cuepoint = Cuepoint.new(cuepoint_params)

    if @cuepoint.save
      flash[:success] = '正常に追加されました'
      redirect_to cuepoints_path
    else
      flash.now[:danger] = '正常に追加されませんでした'
      render :new
    end
  end

  # 編集
  def edit
    @cuepoint = Cuepoint.find(params[:id])
  end

  # 更新
  def update
    @cuepoint = Cuepoint.find(cuepoint_params)

    if @cuepoint.save
      flash[:success] = '正常に更新されました'
      redirect_to cuepoints_path
    else
      flash.now[:danger] = '正常に更新されませんでした'
      render :new
    end
  end

  # 削除
  def destroy
    @cuepoint = Cuepoint.find(params[:id])
    @cuepoint.destroy

    flash[:success] = '正常に削除されました'
    redirect_to cuepoints_url
  end

  private
    # キューポイント用パラメータ
    def cuepoint_params
      params.require(:cuepoint).permit(:name)
    end
end
