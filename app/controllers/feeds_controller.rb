class FeedsController < ApplicationController
  before_action :set_feed, only: %i[ show edit update destroy ]

  def index
    @feeds = Feed.all
  end

  def show
  end

  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end

  def edit
  end

  def create
  @feed = current_user.feed.build(feed_params)
    if @feed.save
      redirect_to feeds_path, notice: "投稿しました！"
    else
      render :new
    end
  end

  def update
    if @feed.update(feed_params)
      redirect_to feeds_path, notice: "投稿が更新しました"
    else
      render :edit
    end
  end

  def destroy
    @feed.destroy
      respond_to feeds_path, notice: "投稿が削除されました。"
  end

  def confirm
    @feed = Feed.new(feed_params)
    @feed.used_id = current_user.id
    render :new if @feed.invalid?
  end

  private

  def set_feed
    @feed = Feed.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(:image, :image_cache, :comment, :user_id)
  end

end
